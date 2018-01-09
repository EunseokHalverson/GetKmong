//
//  MessageVC.swift
//  Kmong
//
//  Created by Eunseok on 2017. 12. 28..
//  Copyright © 2017년 Eunseok. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class MessageVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    var msgList = [Message]()
    
    var ref: DatabaseReference?
    var databaseHandle: DatabaseHandle?
    var handle: AuthStateDidChangeListenerHandle?
    
    
    override func viewDidDisappear(_ animated: Bool) {
        let uss = Auth.auth().currentUser?.uid
        ref = Database.database().reference().child("Message").child(uss!)
        ref?.child("messages").removeAllObservers()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.msgList.removeAll()
        self.tableView.reloadData()
        
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let u = user {
                let uss = Auth.auth().currentUser?.uid
                self.ref = Database.database().reference().child("Message").child(uss!)
                self.ref?.observe(.childAdded, with: { (snapshot) in
                    let snapshotValue = snapshot.value as! NSDictionary
                    let body = snapshotValue["body"] as! String
                    let from = snapshotValue["from"] as! String
                    let date = snapshotValue["date"] as! String
                    let msg = Message(body: body, date: date, from: from)
                    self.msgList.append(msg)
                    self.tableView.reloadData()
                })
                print("USER_SIGNED_IN")
            } else {

                print("USER_SIGNED_OUT")
            }
            
        }
        
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return msgList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? MessageCell{
            cell.timeLbl.text = msgList[indexPath.row].date
            cell.bodyLbl.text = msgList[indexPath.row].body
            cell.fromLbl.text = msgList[indexPath.row].from
            cell.views.layer.cornerRadius = 10
            return cell
        }else{
            return MessageCell()
        }
    }

}
