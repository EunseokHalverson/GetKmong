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
    public var rating: Double
    public var userName: String
    
    init(title: String, imageName: String, rating: Double, userName: String){
        self.title = title
        self.imageName = imageName
        self.rating = rating
        self.userName = userName
    }
    
}
