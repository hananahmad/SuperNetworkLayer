//
//  ServiceConfigurationRequestConfiguration.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on January 15, 2019

import Foundation

class RequestConfiguration : Codable {

        let defaultHeadersConfiguration : [DefaultHeadersConfiguration]?
        let defaultTimeOutInSeconds : Int?
        let requestTypeSupported : [String]?

        enum CodingKeys: String, CodingKey {
                case defaultHeadersConfiguration = "defaultHeadersConfiguration"
                case defaultTimeOutInSeconds = "defaultTimeOutInSeconds"
                case requestTypeSupported = "requestTypeSupported"
        }
    
       required init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                defaultHeadersConfiguration = try values.decodeIfPresent([DefaultHeadersConfiguration].self, forKey: .defaultHeadersConfiguration)
                defaultTimeOutInSeconds = try values.decodeIfPresent(Int.self, forKey: .defaultTimeOutInSeconds)
                requestTypeSupported = try values.decodeIfPresent([String].self, forKey: .requestTypeSupported)
        }

}
