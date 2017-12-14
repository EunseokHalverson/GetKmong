//
//  CategoryCell.swift
//  Kmong
//
//  Created by Eunseok on 2017. 12. 14..
//  Copyright © 2017년 Eunseok. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var categoryImg: UIImageView!
    @IBOutlet weak var categoryLbl: UILabel!
    
    func updateView(category: PageCategory){
        categoryImg.image = UIImage(named: category.imageName)
        categoryLbl.text = category.title
        
    }

}
