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
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        tableView.delegate = self
        tableView.dataSource = self
        let user = Auth.auth().currentUser?.uid
        ref = Database.database().reference().child("Message").child(user!)
        ref?.observe(.childAdded, with: { (snapshot) in
            let snapshotValue = snapshot.value as! NSDictionary
            let body = snapshotValue["body"] as! String
            let from = snapshotValue["from"] as! String
            let date = snapshotValue["date"] as! String
            let msg = Message(body: body, date: date, from: from)
            self.msgList.append(msg)
            self.tableView.reloadData()
        })
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return msgList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? MessageCell{
            cell.updateView(msg: msgList[indexPath.row])
            return cell
        }else{
            return MessageCell()
        }
    }

}
