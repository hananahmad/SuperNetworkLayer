//
//  ServiceConfigurationErrorCodeConfiguration.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on January 15, 2019

import Foundation

public class ErrorCodeConfiguration : Codable {
    
    public var errorCode : Int
    public var errorDescriptionAr : String?
    public var errorDescriptionEn : String?
    
    enum CodingKeys: String, CodingKey {
        case errorCode = "errorCode"
        case errorDescriptionAr = "errorDescriptionAr"
        case errorDescriptionEn = "errorDescriptionEn"
    }
    
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        errorCode = try values.decodeIfPresent(Int.self, forKey: .errorCode) ?? 0
        errorDescriptionAr = try values.decodeIfPresent(String.self, forKey: .errorDescriptionAr)
        errorDescriptionEn = try values.decodeIfPresent(String.self, forKey: .errorDescriptionEn)
    }
    
    public required init()
    {
        self.errorCode = 0
        self.errorDescriptionAr = ""
        self.errorDescriptionEn = ""
    }
    
}
