import Combine
import Foundation
import SmilesStorage

public class NetworkingLayerRequestable: NSObject, Requestable {
    
    public var requestTimeOut: Float = 60
    private var urlSession: URLSession?
    private var delegate: URLSessionDelegate? = nil
    
    public init(requestTimeOut: Float) {
        super.init()
        self.requestTimeOut = requestTimeOut
        if let isSSLEnabled: Bool = SmilesStorageHandler(storageType: .keychain).getValue(forKey: .SSLEnabled), isSSLEnabled {
            delegate = self
        }
    }
    
    public func request<T>(_ req: NetworkRequest) -> AnyPublisher<T, NetworkError>
    where T: Decodable, T: Encodable {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = TimeInterval(req.requestTimeOut ?? requestTimeOut)
        
        guard SmilesNetworkReachability.isAvailable else {
            // Return a fail publisher if the internet is not reachable
            return AnyPublisher(
                Fail<T, NetworkError>(error: NetworkError.networkNotReachable("Please check your connectivity")).eraseToAnyPublisher()
            )
        }
        
        guard let url = URL(string: req.url) else {
            // Return a fail publisher if the url is invalid
            return AnyPublisher(
                Fail<T, NetworkError>(error: NetworkError.badURL("Invalid Url")).eraseToAnyPublisher()
            )
        }
        // We use the dataTaskPublisher from the URLSession which gives us a publisher to play around with.
        
        urlSession = URLSession(configuration: sessionConfig, delegate: delegate, delegateQueue: nil)
        return urlSession!
            .dataTaskPublisher(for: req.buildURLRequest(with: url))
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { output in
                // throw an error if response is nil
                guard output.response is HTTPURLResponse else {
                    throw NetworkError.serverError(code: 0, error: "Server error")
                }
                if let jsonString = output.data.prettyPrintedJSONString {
                    print("---------- Got Response for ----------\n", output.response.url ?? "")
                    print("---------- Request Response ----------\n", jsonString)
                }
                let urlString = output.response.url?.absoluteString ?? ""
                if !urlString.contains("https://nominatim.openstreetmap.org") {
                    let decoder = JSONDecoder()
                    do {
                        let result = try decoder.decode(BaseMainResponse.self, from: output.data)
                        if let errorCode = result.errorCode, errorCode == NetworkErrorCode.sessionExpired.rawValue || errorCode == NetworkErrorCode.sessionExpired2.rawValue {
                            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "SessionExpired"), object: nil)
                        }
                        
                        if let httpResponse = output.response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                            if let responseMessage = result.responseMsg, !responseMessage.isEmpty {
                                throw NetworkError.apiError(code: 0, error: responseMessage)
                            }
                        }
                        
                        if let errorMessage = result.errorMsg, !errorMessage.isEmpty, let errorCode = result.errorCode, !errorCode.isEmpty {
                            throw NetworkError.apiError(code: Int(errorCode) ?? 0, error: errorMessage)
                        }
                    }
                }
                return output.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                // return error if json decoding fails
                print("API error: \(error)")
                switch error {
                case let urlError as URLError:
                    switch urlError.code {
                    case .timedOut :
                        return NetworkError.noResponse("ServiceFail".localizedString)
                    default: break
                    }
                default: break
                }
                if let networkError = error as? NetworkError {
                    return NetworkError.noResponse(networkError.localizedDescription)
                } else {
                    return NetworkError.noResponse(error.localizedDescription)
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    public func upload<T: Codable>(_ req: NetworkRequest, params: [String: Any]?, media: [MediaAttachment]?) -> AnyPublisher<T, NetworkError> where T: Decodable, T: Encodable {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = TimeInterval(600)
        
        guard SmilesNetworkReachability.isAvailable else {
            // Return a fail publisher if the internet is not reachable
            return AnyPublisher(
                Fail<T, NetworkError>(error: NetworkError.networkNotReachable("Please check your connectivity")).eraseToAnyPublisher()
            )
        }
        
        guard let url = URL(string: req.url) else {
            // Return a fail publisher if the url is invalid
            return AnyPublisher(
                Fail<T, NetworkError>(error: NetworkError.badURL("Invalid Url")).eraseToAnyPublisher()
            )
        }
        let request = MultipartFormDataRequest(url: url)
        if let _params = params {
            for (key, value) in _params {
                request.addTextField(named: key, value: value)
            }
        }
        if let _media = media, media?.count ?? 0 > 0 {
            for obj in _media {
                request.addDataField(media: obj)
            }
        }
        var urlRequest = request.asURLRequest()

        urlRequest.timeoutInterval = 600
        urlSession = URLSession(configuration: sessionConfig, delegate: delegate, delegateQueue: nil)
        return urlSession!
            .dataTaskPublisher(for: urlRequest)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { output in
                // throw an error if response is nil
                guard output.response is HTTPURLResponse else {
                    throw NetworkError.serverError(code: 0, error: "Server error")
                }
                if let jsonString = output.data.prettyPrintedJSONString {
                    debugPrint("---------- Got Response for ----------\n", output.response.url ?? "")
                    debugPrint("---------- Request Response ----------\n", jsonString)
                }
                let urlString = output.response.url?.absoluteString ?? ""
                if !urlString.contains("https://nominatim.openstreetmap.org") {
                    let decoder = JSONDecoder()
                    do {
                        let result = try decoder.decode(BaseMainResponse.self, from: output.data)
                        if let errorCode = result.errorCode, errorCode == NetworkErrorCode.sessionExpired.rawValue || errorCode == NetworkErrorCode.sessionExpired2.rawValue {
                            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "SessionExpired"), object: nil)
                        }
                        
                        if let errorMessage = result.errorMsg, !errorMessage.isEmpty, let errorCode = result.errorCode, !errorCode.isEmpty {
                            throw NetworkError.apiError(code: Int(errorCode) ?? 0, error: errorMessage)
                        }
                        
                    }
                }
                return output.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                // return error if json decoding fails
                print("API error: \(error)")
                switch error {
                case let urlError as URLError:
                    switch urlError.code {
                    case .timedOut :
                        return NetworkError.noResponse("ServiceFail".localizedString)
                    default: break
                    }
                default: break
                }
                if let networkError = error as? NetworkError {
                    return NetworkError.noResponse(networkError.localizedDescription)
                } else {
                    return NetworkError.noResponse(error.localizedDescription)
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}

extension NetworkingLayerRequestable: URLSessionDelegate {

    public func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        
        let urlString = challenge.protectionSpace.host
        guard !urlString.contains("maps.googleapis.com/maps/api") && !urlString.contains("nominatim.openstreetmap.org") else {
            completionHandler(.useCredential, nil)
            return
        }
        guard let trust = challenge.protectionSpace.serverTrust else {
            completionHandler(.cancelAuthenticationChallenge, nil)
            return
        }
        if PublicKeyPinner().validate(serverTrust: trust) {
            completionHandler(.useCredential, nil)
        } else {
            completionHandler(.cancelAuthenticationChallenge, nil)
        }
        
    }
    
}

enum NetworkErrorCode: String {
    case sessionExpired = "0000252"
    case sessionExpired2 = "101"
}
