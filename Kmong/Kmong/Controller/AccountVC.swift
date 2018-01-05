//
//  AccountVC.swift
//  Kmong
//
//  Created by Eunseok on 2017. 12. 27..
//  Copyright © 2017년 Eunseok. All rights reserved.
//

import UIKit
import Firebase

class AccountVC: UIViewController {

    @IBOutlet weak var username: UILabel!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){}
    
    
    var handle: AuthStateDidChangeListenerHandle?
    var temp: String = ""
    
    @IBOutlet weak var loginBtn: RoundedButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
          NotificationCenter.default.addObserver(self, selector: #selector(AccountVC.userDataDidChange(_:)), name: Notification.Name("USER_CREATED"), object: nil)
        
    }
    override func viewWillAppear(_ animated: Bool) {
   

    }
    @objc func userDataDidChange(_ notif: Notification){
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let u = user {
                self.username.text = "환영합니다!"
                self.loginBtn.setTitle("Logout", for: .normal)
                print("USER_SIGNED_IN")
            } else {
                self.username.text = "로그인하세요!"
                self.loginBtn.setTitle("Login", for: .normal)
                print("USER_SIGNED_OUT")
            }
            
        }
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        if Auth.auth().currentUser != nil {
            let firebaseAuth = Auth.auth()
            do {
                try firebaseAuth.signOut()
            } catch let signOutError as NSError {
                print ("Error signing out: %@", signOutError)
            }
            let alert = UIAlertController(title: "로그아웃 하셧습니다.",
                                          message: "다시 로그인 해주세요.",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default))
            self.present(alert, animated: true)
            print("Auth. Signed out")
        }else{
            performSegue(withIdentifier: "toLogin", sender: nil)
        }

    }
}
