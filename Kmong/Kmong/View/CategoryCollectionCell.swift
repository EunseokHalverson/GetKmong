//
//  CollectionViewCell.swift
//  Kmong
//
//  Created by Eunseok on 2017. 12. 17..
//  Copyright © 2017년 Eunseok. All rights reserved.
//

import UIKit

class CategoryCollectionCell: UICollectionViewCell {
    @IBOutlet weak var collectionImg: UIImageView!
    @IBOutlet weak var collectionLbl: UILabel!
    
    func updateViews(category: Category){
        collectionImg.image = UIImage(named: category.imageName)
        collectionLbl.text = category.title
    }
}
