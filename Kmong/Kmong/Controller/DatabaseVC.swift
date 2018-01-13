//
//  DatabaseVC.swift
//  Kmong
//
//  Created by Eunseok on 2018. 1. 9..
//  Copyright © 2018년 Eunseok. All rights reserved.
//

import UIKit
import FirebaseStorage
import Firebase
import SwiftyStarRatingView

class DatabaseVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tempView: UIView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    var serviceList = [Service]()
    
    var ref: DatabaseReference?
    var databaseHandle: DatabaseHandle?
    var handle: AuthStateDidChangeListenerHandle?
    
    var buyerUID: String = ""
    var chatId: String = ""
    var getName: String? = ""
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(userDataDidChange), name: Notification.Name("NEW_POST"), object: nil)
        self.serviceList.removeAll()
        self.tableView.reloadData()
        
        spinner.isHidden = false
        tempView.isHidden = false
        spinner.startAnimating()
    
        
        self.ref = Database.database().reference().child("Service")
        self.ref?.observe(.childAdded, with: { (snapshot) in
            let snapshotValue = snapshot.value as! NSDictionary
            let seller = snapshotValue["seller"] as! String
            self.getName = seller
            let desc = snapshotValue["description"] as! String
            let imageName = snapshotValue["imageUrl"] as! String
            let price = snapshotValue["price"] as! String
            let rating = snapshotValue["rating"] as! Double
            let uid = snapshotValue["uid"] as! String
            let storage = Storage.storage()
            let storageRef = storage.reference()
            let islandRef = storageRef.child("Images/\(imageName)")
            
            islandRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    let image = UIImage(data: data!)
                    let service = Service(seller: seller, price: price, image: image,  description: desc, rating: rating, imageName: imageName, uid: uid)
                    
                    self.serviceList.append(service)
                    self.tableView.reloadData()
                    self.spinner.isHidden = true
                    self.tempView.isHidden = true
                    self.spinner.stopAnimating()
                }
            }
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(userDataDidChange), name: Notification.Name("NEW_POST"), object: nil)
        
        spinner.isHidden = true
        tempView.isHidden = true
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc func userDataDidChange(){
        serviceList.removeAll()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return serviceList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceCell", for: indexPath) as? ServiceCell{
            
            cell.serviceSeller.text = serviceList[indexPath.row].seller
            cell.serviceDsc.text = serviceList[indexPath.row].description
            cell.servicePrice.text = serviceList[indexPath.row].price
            cell.serviceImg.image = serviceList[indexPath.row].image
            
            let starRatingView = SwiftyStarRatingView()
            starRatingView.frame = cell.ratingBar.bounds
            starRatingView.allowsHalfStars = true
            starRatingView.maximumValue = 5         //default is 5
            starRatingView.minimumValue = 0         //default is 0
            starRatingView.value = CGFloat(serviceList[indexPath.row].rating!)
            starRatingView.tintColor = #colorLiteral(red: 0.9837014079, green: 0.8553137183, blue: 0.3496560156, alpha: 1)
            starRatingView.isEnabled = false
            
            cell.ratingBar.addSubview(starRatingView)
            cell.views.layer.cornerRadius = 10
            cell.views.layer.borderWidth = 1
            cell.views.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            return cell
        }else{
            return ServiceCell()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "sendMessage" {
            let navController = segue.destination as! UINavigationController
            let detailController = navController.topViewController as! SendMessageVC
            detailController.chatId = chatId
            detailController.sellerName = getName!
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sellerUID = serviceList[indexPath.row].uid!
        let sellerRef = Database.database().reference().child("ChatList").child(sellerUID).childByAutoId()
        chatId = sellerRef.key
        if Auth.auth().currentUser?.uid != nil{
            buyerUID = (Auth.auth().currentUser?.uid)!
            let buyerRef = Database.database().reference().child("ChatList").child(buyerUID).child(chatId)
            let checkActivity = Database.database().reference()
            let updateActivity = Database.database().reference().child("ChatActivity").child(sellerUID).child(buyerUID)
            
            
            let post = ["description": serviceList[indexPath.row].description!,
                        "imageUrl": serviceList[indexPath.row].imageName!,
                        "seller": serviceList[indexPath.row].seller!] as [String : Any]
            
            let postChat = ["chatId": chatId]
            
            getName = serviceList[indexPath.row].seller!
            checkActivity.child("ChatActivity").child(sellerUID).child(buyerUID).observe(.value, with: { snapshot in
                if snapshot.exists(){
                    let snapshotValue = snapshot.value as! NSDictionary
                    self.chatId = snapshotValue["chatId"] as! String
                    self.performSegue(withIdentifier: "sendMessage", sender: nil)
                }else{
                    if sellerUID != self.buyerUID{
                        updateActivity.updateChildValues(postChat)
                        sellerRef.updateChildValues(post)
                        buyerRef.updateChildValues(post)
                    }else{
                        print("same user")
                    }
                }
            })
        }else{
            let alert = UIAlertController(title: "메세지를 보내시려면 로그인해주세요.",
                                          message: "",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default))
            self.present(alert, animated: true)
        }
        

    }

}
