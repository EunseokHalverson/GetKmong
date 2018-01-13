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
        static let databaseChats = databaseRoot.child("Chat")
    }
}

class Service{
    
    var seller: String?
    var price: String?
    var image: UIImage?
    var imageName: String?
    //var title: String?
    var description: String?
    var rating: Double?
    var uid: String?
    
    
    init(seller: String, price: String?, image: UIImage?, description: String?, rating: Double?, imageName: String?, uid: String?){
        self.seller = seller
        self.price = price
        self.image = image
        self.description = description
        self.rating = rating
        self.imageName = imageName
        self.uid = uid
    }
}
