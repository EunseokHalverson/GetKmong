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
    
    private let categories = [
        Category(title: "자기소개", imageName: "008-resume.png"),
        Category(title: "학력&전공", imageName: "007-mortarboard.png"),
        Category(title: "경험", imageName: "006-group.png"),
        Category(title: "연락처", imageName: "005-agenda.png")
    ]
    
    private let items = [
        Item(title: "Swift", imageName: "swift", rating: 4, userName: "CodingByEunseok"),
        Item(title: "Java", imageName: "java", rating: 3.5, userName: "CodingByEunseok"),
        Item(title: "C", imageName: "c", rating: 3, userName: "CodingByEunseok"),
        Item(title: "C++", imageName: "c++", rating: 3, userName: "CodingByEunseok"),
        Item(title: "Unity3D Gaming", imageName: "unity3d", rating: 3, userName: "CodingByEunseok")
    ]
    
    private let values = [
        Value(title: "#용기", imageName: "courage"),
        Value(title: "#열정", imageName: "passion"),
        Value(title: "#커뮤니케이션", imageName: "communication"),
        Value(title: "#호기심", imageName: "curiosity"),
    ]
    
    func getPageCategories() -> [Category] {
        return pageCategories
    }
    
    func getCategories() -> [Category] {
        return categories
    }
    
    func getItems() -> [Item] {
        return items
    }
    
    func getValues() -> [Value]{
        return values
    }
    
}
