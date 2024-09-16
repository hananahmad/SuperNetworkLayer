//
//  ServiceConfigurationWebServicesConfiguration.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on January 15, 2019

import Foundation

class WebServicesConfiguration : Codable {

        let customHeaders : [CustomHeader]?
        let enableCache : Bool?
        let enableCookie : Bool?
        let enableSSL : Bool?
        let httpMethod : String?
        let inputModel : String?
        let outputModel : String?
        let requestType : String?
        let serviceUri : String?
        let timeOutInSeconds : Int?

        enum CodingKeys: String, CodingKey {
                case customHeaders = "CustomHeaders"
                case enableCache = "enableCache"
                case enableCookie = "enableCookie"
                case enableSSL = "enableSSL"
                case httpMethod = "httpMethod"
                case inputModel = "inputModel"
                case outputModel = "outputModel"
                case requestType = "requestType"
                case serviceUri = "serviceUri"
                case timeOutInSeconds = "timeOutInSeconds"
        }
    
        required init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                customHeaders = try values.decodeIfPresent([CustomHeader].self, forKey: .customHeaders)
                enableCache = try values.decodeIfPresent(Bool.self, forKey: .enableCache)
                enableCookie = try values.decodeIfPresent(Bool.self, forKey: .enableCookie)
                enableSSL = try values.decodeIfPresent(Bool.self, forKey: .enableSSL)
                httpMethod = try values.decodeIfPresent(String.self, forKey: .httpMethod)
                inputModel = try values.decodeIfPresent(String.self, forKey: .inputModel)
                outputModel = try values.decodeIfPresent(String.self, forKey: .outputModel)
                requestType = try values.decodeIfPresent(String.self, forKey: .requestType)
                serviceUri = try values.decodeIfPresent(String.self, forKey: .serviceUri)
                timeOutInSeconds = try values.decodeIfPresent(Int.self, forKey: .timeOutInSeconds)
        }

}
