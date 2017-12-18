//
//  HomeUrlVC.swift
//  Kmong
//
//  Created by Eunseok on 2017. 12. 18..
//  Copyright © 2017년 Eunseok. All rights reserved.
//

import UIKit
import AVKit

class HomeUrlVC: UIViewController {

    @IBAction func urlBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "showVideo", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
