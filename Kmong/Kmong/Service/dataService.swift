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
        PageCategory(title: "#자기소개", imageName: "008-resume.png"),
        PageCategory(title: "#학력&전공", imageName: "007-mortarboard.png"),
        PageCategory(title: "#경험", imageName: "006-group.png"),
        PageCategory(title: "#연락처", imageName: "005-agenda.png")
    ]
    
    func getPageCategories() -> [PageCategory] {
        return pageCategories
    }
    
}
