//
//  File.swift
//  
//
//  Created by Hanan Ahmed on 9/6/22.
//

import Foundation
import Combine

public protocol Requestable: AnyObject {
    var requestTimeOut: Float { get }
    func request<T: Codable>(_ req: NetworkRequest) -> AnyPublisher<T, NetworkError>
    func upload<T: Codable>(_ req: NetworkRequest, params: [String: Any]?, media: [MediaAttachment]?) -> AnyPublisher<T, NetworkError>
}
