//
//  Service.swift
//  Kmong
//
//  Created by Eunseok on 2018. 1. 9..
//  Copyright © 2018년 Eunseok. All rights reserved.
//

import Foundation
import Firebase


struct Constants
{
    struct refs
    {
        static let databaseRoot = Database.database().reference()
        static let databaseChats = databaseRoot.child("chats")
    }
}

class Service{
    
    var seller: String?
    var price: String?
    var image: UIImage?
    //var title: String?
    var description: String?
    var rating: Double?
    
    init(seller: String, price: String?, image: UIImage?, description: String?, rating: Double?){
        self.seller = seller
        self.price = price
        self.image = image
        self.description = description
        self.rating = rating
    }
}
