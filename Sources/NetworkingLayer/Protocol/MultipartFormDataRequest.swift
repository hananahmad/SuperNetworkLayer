//
//  File.swift
//  
//
//  Created by Asad Ullah on 05/06/2024.
//

import Foundation

struct MultipartFormDataRequest {
    
    private let boundary: String = "---------------------------14737809831466499882746641449"
    private var httpBody = NSMutableData()
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func addTextField(named name: String, value: Any) {
        if let value = value as? String {
            httpBody.append(textFormField(named: name, value: value))
        }else {
            if let value = convertValueToString(value) {
                httpBody.append(textFormField(named: name, value: value))
            }
        }
    }
    
    private func textFormField(named name: String, value: String) -> String {
        
        var fieldString = "--\(boundary)\r\n"
        fieldString += "Content-Disposition: form-data; name=\"\(name)\"\r\n"
        fieldString += "\r\n"
        fieldString += "\(value)\r\n"
        return fieldString
        
    }
    
    func addDataField(media: MediaAttachment) {
        httpBody.append(dataFormField(named: media.key, fileName: media.fileName, data: media.data, mimeType: media.mimeType))
    }
    
    private func dataFormField(named name: String, fileName: String, data: Data, mimeType: String) -> Data {
        
        let fieldData = NSMutableData()
        fieldData.append("--\(boundary)\r\n")
        fieldData.append("Content-Disposition: form-data; name=\"\(name)\"; filename=\"\(fileName)\"\r\n")
        fieldData.append("Content-Type: \(mimeType)\r\n\r\n")
        fieldData.append(data)
        fieldData.append("\r\n")
        return fieldData as Data
    }
    
    func asURLRequest() -> URLRequest {
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("no-cache", forHTTPHeaderField: "Cache-Control")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("pre_prod", forHTTPHeaderField: "custom_header")
        let contentType = "multipart/form-data; boundary=\(boundary)"
        request.setValue(contentType, forHTTPHeaderField: "Content-Type")
        
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        httpBody.append("--\(boundary)--")
        request.httpBody = httpBody as Data
        request.setValue(String(httpBody.count), forHTTPHeaderField: "Content-Length")
        printRequestData(request)
        return request
    }
    
}
extension MultipartFormDataRequest {
    func convertValueToString(_ value: Any) -> String? {
        if let stringValue = value as? String {
            return stringValue
        } else if let numberValue = value as? NSNumber {
            return numberValue.stringValue
        } else if let boolValue = value as? Bool {
            return boolValue ? "true" : "false"
        } else if let arrayValue = value as? [Any] {
            if let data = try? JSONSerialization.data(withJSONObject: arrayValue, options: []),
               let jsonString = String(data: data, encoding: .utf8) {
                return jsonString
            }
        } else if let dictionaryValue = value as? [String: Any] {
            if let data = try? JSONSerialization.data(withJSONObject: dictionaryValue, options: []),
               let jsonString = String(data: data, encoding: .utf8) {
                return jsonString
            }
        }
        return nil
    }
    
    private func printRequestData(_ request: URLRequest) {
        
        debugPrint("---------- Request URL ----------\n", url)
        debugPrint("---------- Request Method ----------\n", request.httpMethod ?? "")
        if let headers = request.allHTTPHeaderFields {
            debugPrint("---------- Request Headers ----------\n", headers)
        }
        if let body = request.httpBody, let jsonString = body.prettyPrintedJSONString {
            debugPrint("---------- Request Body ----------\n", jsonString)
        }
        
    }
}
extension NSMutableData {
    
    func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            self.append(data)
        }
    }
    
}

public struct MediaAttachment {
    public let key: String
    public let data: Data
    public let mimeType: String
    public let fileName: String
    
    public init(key: String, data: Data, mimeType: String, fileName: String) {
        self.key = key
        self.data = data
        self.mimeType = mimeType
        self.fileName = fileName
    }
    
}
