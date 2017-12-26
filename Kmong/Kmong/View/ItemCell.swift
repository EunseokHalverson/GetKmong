//
//  ItemCell.swift
//  Kmong
//
//  Created by Eunseok on 2017. 12. 19..
//  Copyright © 2017년 Eunseok. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    @IBOutlet weak var itemImg: UIImageView!
    @IBOutlet weak var itemLbl: UILabel!
    @IBOutlet weak var itemUserName: UILabel!
    @IBOutlet weak var itemRating: UILabel!
    @IBOutlet weak var views: UIView!
    
    func updateView(item: Item){
        itemImg.image = UIImage(named: item.imageName)
        itemLbl.text = item.title
        itemUserName.text = item.userName
        itemRating.text = item.rating
        views.layer.cornerRadius = 5
    }
    
}
