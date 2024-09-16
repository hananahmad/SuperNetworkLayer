//
//  ServiceConfigurationResponseConfiguration.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on January 15, 2019

import Foundation

class ResponseConfiguration : Codable {

        let errorCodeConfiguration : [ErrorCodeConfiguration]?

        enum CodingKeys: String, CodingKey {
                case errorCodeConfiguration = "ErrorCodeConfiguration"
        }
    
       required init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                errorCodeConfiguration = try values.decodeIfPresent([ErrorCodeConfiguration].self, forKey: .errorCodeConfiguration)
        }

}
