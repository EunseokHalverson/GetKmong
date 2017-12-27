//
//  MessageVC.swift
//  Kmong
//
//  Created by Eunseok on 2017. 12. 28..
//  Copyright © 2017년 Eunseok. All rights reserved.
//

import UIKit
import FirebaseDatabase

class MessageVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    var postData = [String]()
    var ref: DatabaseReference?
    var databaseHandle: DatabaseHandle?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        ref = Database.database().reference()
        databaseHandle = ref?.child("Posts").observe(.childAdded, with: { (snapshot) in
            let post = snapshot.value as? String
            if let actualPost = post{
                self.postData.append(actualPost)
                self.tableView.reloadData()
            }
            
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell")
        cell?.textLabel?.text = postData[indexPath.row]
        
        return cell!
    }

}
