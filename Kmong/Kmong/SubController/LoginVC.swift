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


    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spinner.isHidden = true
        // Do any additional setup after loading the view.
    }

    @IBAction func backBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "unwind", sender: self)
    }
    @IBAction func loginBtnPressed(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
        if let email = emailLabel.text, let pass = passwordLabel.text{
            Auth.auth().signIn(withEmail: email, password: pass){ (user, error) in
                if let u = user{
                    self.spinner.isHidden = true
                    self.spinner.stopAnimating()
                    self.performSegue(withIdentifier: "unwind", sender: self)
                    NotificationCenter.default.post(name: Notification.Name("USER_CREATED"), object: nil)
                    NotificationCenter.default.post(name: Notification.Name("AA"), object: nil)
                }else{
                    self.spinner.isHidden = true
                    self.spinner.stopAnimating()
                    let alert = UIAlertController(title: "가입되어 있지 않은 이메일 주소입니다.",
                                                  message: "다시 로그인해주세요.",
                                                  preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "확인", style: .default))
                    self.present(alert, animated: true)
                }
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailLabel.resignFirstResponder()
        passwordLabel.resignFirstResponder()
    }
}
