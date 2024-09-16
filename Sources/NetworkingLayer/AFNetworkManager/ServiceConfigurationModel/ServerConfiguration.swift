//
//  ServiceConfigurationServerConfiguration.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on January 15, 2019

import Foundation

class ServerConfiguration : Codable {

        let enabledLog : Bool?

        enum CodingKeys: String, CodingKey {
                case enabledLog = "enabledLog"
        }
    
       required init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                enabledLog = try values.decodeIfPresent(Bool.self, forKey: .enabledLog)
        }

}
