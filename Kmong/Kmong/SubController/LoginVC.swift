//
//  LoginVC.swift
//  Kmong
//
//  Created by Eunseok on 2017. 12. 27..
//  Copyright © 2017년 Eunseok. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class LoginVC: UIViewController {


    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func loginBtnPressed(_ sender: Any) {
        
        if let email = emailLabel.text, let pass = passwordLabel.text{
            Auth.auth().signIn(withEmail: email, password: pass){ (user, error) in
                if let u = user{
                    self.performSegue(withIdentifier: "unwind", sender: self)
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
