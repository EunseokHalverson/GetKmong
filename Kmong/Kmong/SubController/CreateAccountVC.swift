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
    @IBOutlet weak var usernameLabel: UITextField!
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
        if let email = emailLabel.text, let pass = passwordLabel.text, let name = usernameLabel.text{
            Auth.auth().createUser(withEmail: email, password: pass){ (user, error) in
                if let u = user{
                    let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                    changeRequest?.displayName = name
                    changeRequest?.commitChanges { (error) in
                    }
                    self.spinner.isHidden = true
                    self.spinner.stopAnimating()
                    self.performSegue(withIdentifier: "unwind", sender: self)
                    
                    NotificationCenter.default.post(name: Notification.Name("USER_CREATED"), object: nil)
                    print("Auth. Created Account")

                }else{
                    self.spinner.isHidden = true
                    self.spinner.stopAnimating()
                    let alert = UIAlertController(title: "이미 존재하는 이메일이거나, 잘못된 이메일입니다.",
                                                  message: "다시 시도해주세요.",
                                                  preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "확인", style: .default))
                    self.present(alert, animated: true)
                    print("Auth. Can't Create Account")
                }
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailLabel.resignFirstResponder()
        passwordLabel.resignFirstResponder()
    }
}
