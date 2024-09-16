//
//  ServiceConfiguration.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on January 15, 2019

import Foundation

class ServiceConfiguration : Codable {

        let requestConfiguration : RequestConfiguration?
        let responseConfiguration : ResponseConfiguration?
        let serverConfiguration :ServerConfiguration?
        let webServicesConfiguration : [WebServicesConfiguration]?

        enum CodingKeys: String, CodingKey {
                case requestConfiguration = "RequestConfiguration"
                case responseConfiguration = "ResponseConfiguration"
                case serverConfiguration = "ServerConfiguration"
                case webServicesConfiguration = "WebServicesConfiguration"
        }
    
    required init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                requestConfiguration = try RequestConfiguration(from: decoder)
                responseConfiguration = try ResponseConfiguration(from: decoder)
                serverConfiguration = try ServerConfiguration(from: decoder)
                webServicesConfiguration = try values.decodeIfPresent([WebServicesConfiguration].self, forKey: .webServicesConfiguration)
        }

}
