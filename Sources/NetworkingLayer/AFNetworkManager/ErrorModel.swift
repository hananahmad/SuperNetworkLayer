//
//  ErrorModel.swift
//  YayOrNay
//
//  Created by Mahmoud Fathy on 8/3/18.
//  Copyright © 2018 Mahmoud Fathy. All rights reserved.
//

import Foundation


class ErrorModel: Error {
    private var code: Int!
    private var message: String!
    
    var _code: Int {
        get {
            if code == nil {
                code = 0
            }
            return code
        }
        set {
            code = newValue
        }
    }
    
    var _message: String {
        get {
            if message == nil {
                message = ""
            }
            return message
        }
        set {
            message = newValue
        }
    }
    
    init() {}
}
