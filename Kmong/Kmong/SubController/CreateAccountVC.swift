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
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spinner.isHidden = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateAccountVC.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(){
        view.endEditing(true)
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "unwind", sender: self)
    }
    @IBAction func createBtnPressed(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
        if let email = emailLabel.text, let pass = passwordLabel.text{
            Auth.auth().createUser(withEmail: email, password: pass){ (user, error) in
                if let u = user{
                    self.spinner.isHidden = true
                    self.spinner.stopAnimating()
                    self.performSegue(withIdentifier: "unwind", sender: self)
                    NotificationCenter.default.post(name: Notification.Name("USER_CREATED"), object: nil)
                    print("Created Account")
                }else{
                    print("Can't Account")
                }
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailLabel.resignFirstResponder()
        passwordLabel.resignFirstResponder()
    }
}
