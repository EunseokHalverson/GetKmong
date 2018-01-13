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

class MessageVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!

    var messageList = [Message]()
    
    var ref: DatabaseReference?
    var databaseHandle: DatabaseHandle?
    var handle: AuthStateDidChangeListenerHandle?
    
    var chatId: String = ""
    var sellerName: String = ""
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.messageList.removeAll()
        self.tableView.reloadData()
        
        spinner.isHidden = false
        views.isHidden = false
        spinner.startAnimating()
        
        self.ref = Database.database().reference().child("ChatList").child(Auth.auth().currentUser!.uid)
        self.ref?.observe(.childAdded, with: { (snapshot) in
            let snapshotValue = snapshot.value as! NSDictionary
            let seller = snapshotValue["seller"] as! String
            let desc = snapshotValue["description"] as! String
            let image = snapshotValue["imageUrl"] as! String
            let chatId = snapshot.key
            
            let storage = Storage.storage()
            let storageRef = storage.reference()
            let islandRef = storageRef.child("Images/\(image).png")
            
            islandRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    let image = UIImage(data: data!)
                    let msgList = Message(sellerImage: image, seller: seller, description: desc, chatId: chatId)
                    
                    self.messageList.append(msgList)
                    self.tableView.reloadData()
                    self.spinner.isHidden = true
                    self.views.isHidden = true
                    self.spinner.stopAnimating()
                }
            }
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageList.removeAll()
        tableView.reloadData()
        spinner.isHidden = true
        views.isHidden = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateAccountVC.handleTap))
        view.addGestureRecognizer(tap)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBOutlet weak var views: UIView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as? MessageCell{
            
            cell.seller.text = messageList[indexPath.row].seller
            cell.desc.text = messageList[indexPath.row].description
            cell.sellerImage.image = messageList[indexPath.row].sellerImage

            return cell
        }else{
            return MessageCell()
        }
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    @objc func handleTap(){
        view.endEditing(true)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        searchBar.resignFirstResponder()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "sendMessage" {
            let navController = segue.destination as! UINavigationController
            let detailController = navController.topViewController as! SendMessageVC
            detailController.chatId = chatId
            detailController.sellerName = sellerName
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chatId = messageList[indexPath.row].chatId!
        sellerName = messageList[indexPath.row].seller!
        performSegue(withIdentifier: "sendMessage", sender: nil)
    }
    

}
