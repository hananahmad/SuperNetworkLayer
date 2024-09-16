//
//  ServiceConfigurationCustomHeader.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on January 15, 2019

import Foundation

class CustomHeader : Codable {

        let name : String?
        let value : String?

        enum CodingKeys: String, CodingKey {
                case name = "name"
                case value = "value"
        }
    
       required init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                name = try values.decodeIfPresent(String.self, forKey: .name)
                value = try values.decodeIfPresent(String.self, forKey: .value)
        }
    
    
    

}
