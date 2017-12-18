//
//  PageView.swift
//  Kmong
//
//  Created by Eunseok on 2017. 12. 16..
//  Copyright © 2017년 Eunseok. All rights reserved.
//

import UIKit

class PageView: UIViewController {
    
    @IBOutlet weak var pageLbl: UILabel!
    @IBOutlet weak var pageImg: UIImageView!
    
    var tempVC: UIViewController!
    
    var itemIndex: Int = 0
    var imageName: String = "" {
        didSet{
            if let imageView = pageImg {
                imageView.image = UIImage(named: imageName)
            }
        }
    }
    var lblText: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        pageImg.image = UIImage(named: imageName)
        pageLbl.text = lblText
    }

    @IBAction func toMyselfBtnPressed(_ sender: Any) {
        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "categoryToMyself") as UIViewController
        self.present(viewController, animated: false, completion: nil)
    }
    
    
}
