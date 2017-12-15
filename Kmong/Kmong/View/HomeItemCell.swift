//
//  HomeItemCell.swift
//  Kmong
//
//  Created by Eunseok on 2017. 12. 16..
//  Copyright © 2017년 Eunseok. All rights reserved.
//

import UIKit

class HomeItemCell: UITableViewCell {

    @IBOutlet weak var homeItemImg: UIImageView!
    @IBOutlet weak var homeItemLbl: UILabel!
    @IBOutlet weak var homeItemPrice: UILabel!
    @IBOutlet weak var homeItemRating: UILabel!
    
    func updateView(item: Item){
        homeItemImg.image = UIImage(named: item.imageName)
        homeItemLbl.text = item.title
        homeItemPrice.text = item.price
        homeItemRating.text = item.rating
    }
}
