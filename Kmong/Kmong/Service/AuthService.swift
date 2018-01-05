//
//  AuthService.swift
//  Kmong
//
//  Created by Eunseok on 2018. 1. 5..
//  Copyright © 2018년 Eunseok. All rights reserved.
//

import Foundation

class AuthService {
    
    static let instance = AuthService()
    
    let defaults = UserDefaults.standard
    
    var isLoggedIn : Bool {
        get{
            return defaults.bool(forKey: "isloggedin")
        }
        set{
            defaults.set(newValue, forKey: "isloggedin")
        }
    }
    
    var authToken : String {
        get{
            return defaults.value(forKey: "TOKEN_KEY") as! String
        }
        set{
            defaults.set(newValue, forKey: "TOKEN_KEY")
        }
    }
    
    var userEmail: String {
        get{
            return defaults.value(forKey: "USER_EMAIL") as! String
        }
        set{
            defaults.set(newValue, forKey: "USER_EMAIL")
        }
    }
}
