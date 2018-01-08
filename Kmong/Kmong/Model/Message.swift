//
//  Message.swift
//  Kmong
//
//  Created by Eunseok on 2018. 1. 8..
//  Copyright © 2018년 Eunseok. All rights reserved.
//

import Foundation

class Message{
    var body: String?
    var date: String?
    var from: String?
    
    init(body: String, date: String?, from: String?){
        self.body = body
        self.date = date
        self.from = from
    }
}
