//
//  Message.swift
//  Kmong
//
//  Created by Eunseok on 2018. 1. 8..
//  Copyright © 2018년 Eunseok. All rights reserved.
//

import Foundation

class Message{
    
    var sellerImage: UIImage?
    var seller: String?
    var description: String?
    var chatId: String?
    
    init(sellerImage: UIImage?, seller: String?, description: String?, chatId: String?){
        self.sellerImage = sellerImage
        self.seller = seller
        self.description = description
        self.chatId = chatId
    }
}
