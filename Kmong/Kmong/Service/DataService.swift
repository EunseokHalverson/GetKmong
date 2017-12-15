//
//  dataService.swift
//  Kmong
//
//  Created by Eunseok on 2017. 12. 14..
//  Copyright © 2017년 Eunseok. All rights reserved.
//

import Foundation

class DataService {
    static let instance = DataService()
    
    
    private let pageCategories = [
        Category(title: "#자기소개", imageName: "008-resume.png"),
        Category(title: "#학력&전공", imageName: "007-mortarboard.png"),
        Category(title: "#경험", imageName: "006-group.png"),
        Category(title: "#연락처", imageName: "005-agenda.png")
    ]
    
    private let items = [
        Item(title: "C 기본", imageName: "icons8-comedy-2-filled-100", price: "10000", rating: "3"),
        Item(title: "Java 기본", imageName: "icons8-comedy-2-filled-100", price: "35000", rating: "2"),
        Item(title: "Swift 기본", imageName: "icons8-comedy-2-filled-100", price: "40000", rating: "4"),
        Item(title: "C++ 기본", imageName: "icons8-comedy-2-filled-100", price: "20000", rating: "1"),
        Item(title: "Unity3D Gaming 기본", imageName: "icons8-comedy-2-filled-100", price: "50000", rating: "5")
    ]
    
    func getPageCategories() -> [Category] {
        return pageCategories
    }
    
    func getItems() -> [Item] {
        return items
    }

  
}
