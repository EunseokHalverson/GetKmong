//
//  CreateAccountVC.swift
//  Kmong
//
//  Created by Eunseok on 2017. 12. 27..
//  Copyright © 2017년 Eunseok. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class CreateAccountVC: UIViewController {


    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func createBtnPressed(_ sender: Any) {
        if let email = emailLabel.text, let pass = passwordLabel.text{
            Auth.auth().createUser(withEmail: email, password: pass){ (user, error) in
                if let u = user{
                    
                }else{
                    
                }
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailLabel.resignFirstResponder()
        passwordLabel.resignFirstResponder()
    }
}
