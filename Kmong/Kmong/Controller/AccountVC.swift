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
    
    @IBOutlet weak var loginBtn: RoundedButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                self.username.text = "환영합니다!"
                self.loginBtn.setTitle("Logout", for: .normal)
                
            } else {
                self.username.text = "로그인하세요!"
                self.loginBtn.setTitle("Login", for: .normal)
            }
            
        }
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    override func viewDidLoad() {
        NotificationCenter.default.addObserver(self, selector: #selector(AccountVC.userDataDidChange(_:)), name: Notification.Name("USER_CREATED"), object: nil)
        super.viewDidLoad()

    }
    @objc func userDataDidChange(_ notif: Notification){
        
    }
    @IBAction func loginBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "toLogin", sender: nil)
    }
}
