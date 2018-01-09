//
//  ItemCell.swift
//  Kmong
//
//  Created by Eunseok on 2017. 12. 19..
//  Copyright © 2017년 Eunseok. All rights reserved.
//

import UIKit
import SwiftyStarRatingView

class ItemCell: UITableViewCell {
    
    @IBOutlet weak var itemImg: UIImageView!
    @IBOutlet weak var itemLbl: UILabel!
    @IBOutlet weak var itemUserName: UILabel!
    @IBOutlet weak var itemRating: UILabel!
    @IBOutlet weak var views: UIView!
    @IBOutlet weak var ratingBarView: UIView!
    
    @IBOutlet weak var ratingBar: UIView!
    
    
    
    func updateView(item: Item){
        itemImg.image = UIImage(named: item.imageName)
        itemLbl.text = item.title
        itemUserName.text = item.userName
        views.layer.cornerRadius = 5
        views.layer.borderWidth = 1
        views.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        let starRatingView = SwiftyStarRatingView()
        starRatingView.frame = ratingBar.bounds
        starRatingView.allowsHalfStars = true
        starRatingView.maximumValue = 5         //default is 5
        starRatingView.minimumValue = 0         //default is 0
        starRatingView.value = CGFloat(item.rating)               //default is 0
        starRatingView.tintColor = #colorLiteral(red: 0.9837014079, green: 0.8553137183, blue: 0.3496560156, alpha: 1)
        ratingBar.addSubview(starRatingView)

    }
    
}
