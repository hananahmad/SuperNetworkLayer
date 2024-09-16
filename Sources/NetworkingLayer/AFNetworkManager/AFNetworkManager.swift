//
//  File.swift
//
//
//  Created by Abdul Rehman Amjad on 30/05/2023.
//

import Foundation
import Combine

@objc public class NetworkManager: NSObject {
    
    var networkRequest: NetworkingLayerRequestable = NetworkingLayerRequestable(requestTimeOut: 60)
    private var cancellables: Set<AnyCancellable> = []
    
    public init(networkRequest: NetworkingLayerRequestable) {
        self.networkRequest = networkRequest
    }
    
    public override init() {}
    
    @discardableResult
    public func handleService<T: Codable>(request: NetworkRequest,
                                          completionHandler: @escaping (_ response: T) -> (),
                                          failureBlock: @escaping (_ error: ErrorCodeConfiguration?) -> ()) -> AnyCancellable {
        
        let cancellable = networkRequest.request(request)
            .sink { completion in
                debugPrint(completion)
                switch completion {
                case .failure(let error):
                    let errorModel = ErrorCodeConfiguration()
                    errorModel.errorCode = (error as NSError).code
                    errorModel.errorDescriptionEn = error.localizedDescription
                    errorModel.errorDescriptionAr = error.localizedDescription
                    failureBlock(errorModel)
                case .finished:
                    debugPrint("nothing much to do here")
                }
            } receiveValue: { response in
                completionHandler(response)
            }
        
        // Store the cancellable object
        cancellables.insert(cancellable)
        
        return cancellable
        
    }
    
    public func cancelRequests() {
        // Cancel all stored cancellable objects
        cancellables.forEach { $0.cancel() }
        cancellables.removeAll()
    }
    
    @objc public func handleService(with request: NSMutableURLRequest, completion: @escaping (URLResponse?, [String: Any]?, Error?) -> Void) {
        
        printRequestData(request: request)
        // Create a URLSession instance
        let session = URLSession.shared
        
        // Create a URLSessionDataTask to make the API request
        let task = session.dataTask(with: request as URLRequest) { data, response, error in
            
            // Check if data is available
            guard let responseData = data else {
                DispatchQueue.main.async {
                    completion(response, nil, NSError(domain: "No data received", code: 0, userInfo: nil))
                }
                return
            }
            
            // Parse the data
            do {
                // Assuming the response data is JSON
                if let json = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: Any] {
                    DispatchQueue.main.async {
                        completion(response, json, nil)
                    }
                }
                if let jsonString = data?.prettyPrintedJSONString {
                    print("---------- Got Response for ----------\n", response?.url ?? "")
                    print("---------- Request Response ----------\n", jsonString)
                }
                
            } catch {
                DispatchQueue.main.async {
                    completion(response, nil, error)
                }
            }
            
        }
        
        // Start the URLSessionDataTask
        task.resume()
    }
    
    private func printRequestData(request: NSMutableURLRequest) {
        
        print("---------- Request URL ----------\n", request.url ?? "")
        print("---------- Request Method ----------\n", request.httpMethod)
        if let headers = request.allHTTPHeaderFields {
            print("---------- Request Headers ----------\n", headers)
        }
        if let body = request.httpBody, let jsonString = body.prettyPrintedJSONString {
            print("---------- Request Body ----------\n", jsonString)
        }
        
    }
    
}
