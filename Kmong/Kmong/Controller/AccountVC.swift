//
//  AccountVC.swift
//  Kmong
//
//  Created by Eunseok on 2017. 12. 27..
//  Copyright © 2017년 Eunseok. All rights reserved.
//

import UIKit

class AccountVC: UIViewController {

    @IBOutlet weak var username: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func loginBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "toLogin", sender: nil)
    }
}
