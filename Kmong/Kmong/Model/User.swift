//
//  User.swift
//  Kmong
//
//  Created by Eunseok on 2018. 1. 8..
//  Copyright © 2018년 Eunseok. All rights reserved.
//

import Foundation


class User {
    var uid: String?
    var userName: String?
    var email: String?
    var phoneNum: Int?
    
    init(uid: String, userName: String, email: String?, phoneNum: Int?){
        self.uid = uid
        self.userName = userName
        self.email = email
        self.phoneNum = phoneNum
    }
}
