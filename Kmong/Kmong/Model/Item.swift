//
//  Item.swift
//  Kmong
//
//  Created by Eunseok on 2017. 12. 16..
//  Copyright © 2017년 Eunseok. All rights reserved.
//

import Foundation

struct Item{
    
    public var title: String
    public var imageName: String
    public var price: String
    public var rating: String
    
    init(title: String, imageName: String, price: String, rating: String){
        self.title = title
        self.imageName = imageName
        self.price = price
        self.rating = rating
    }
    
}
