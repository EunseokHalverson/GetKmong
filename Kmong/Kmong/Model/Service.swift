//
//  Service.swift
//  Kmong
//
//  Created by Eunseok on 2018. 1. 9..
//  Copyright © 2018년 Eunseok. All rights reserved.
//

import Foundation

class Service{
    
    var seller: String?
    var price: String?
    var image: String?
    var name: String?
    var description: String?
    
    init(seller: String, price: String?, image: String?, name: String?, description: String?){
        self.seller = seller
        self.price = price
        self.image = image
        self.name = name
        self.description = description
    }
}
