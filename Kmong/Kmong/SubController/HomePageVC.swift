//
//  HomePageVC.swift
//  Kmong
//
//  Created by Eunseok on 2017. 12. 16..
//  Copyright © 2017년 Eunseok. All rights reserved.
//

import UIKit

class HomePageVC: UIViewController{
    @IBOutlet weak var homeLbl: UILabel!
    @IBOutlet weak var homeImg: UIImageView!
    
    var pageIndex: Int?
    var titleText : String!
    var imageName : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeImg.image = UIImage(named: imageName)
        self.homeLbl.text = self.titleText
        self.homeLbl.alpha = 0.1
        UIView.animate(withDuration: 1.0, animations: { () -> Void in
            self.homeLbl.alpha = 1.0
        })
        
    }
}
