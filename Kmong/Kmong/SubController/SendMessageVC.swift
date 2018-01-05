//
//  SendMessageVC.swift
//  Kmong
//
//  Created by Eunseok on 2017. 12. 28..
//  Copyright © 2017년 Eunseok. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class SendMessageVC: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    var ref: DatabaseReference!
    
    
    
    @IBAction func sendMessagePressed(_ sender: Any) {
        ref.child("Message").childByAutoId().setValue(textView.text)
        
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    @IBAction func backBtnPressed(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        // Do any additional setup after loading the view.
    }

   
    
}
