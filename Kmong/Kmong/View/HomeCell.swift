//
//  HomeCell.swift
//  Kmong
//
//  Created by Eunseok on 2017. 12. 16..
//  Copyright © 2017년 Eunseok. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {

    @IBOutlet weak var homeImg: UIImageView!
    @IBOutlet weak var homeLbl: UILabel!
    
    func updateView(category: Category){
        homeImg.image = UIImage(named: category.imageName)
        homeLbl.text = category.title
        
    }

}
