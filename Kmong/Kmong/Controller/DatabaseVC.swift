//
//  DatabaseVC.swift
//  Kmong
//
//  Created by Eunseok on 2018. 1. 9..
//  Copyright © 2018년 Eunseok. All rights reserved.
//

import UIKit
import Firebase

class DatabaseVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    var serviceList = [Service]()
    
    var ref: DatabaseReference?
    var databaseHandle: DatabaseHandle?
    var handle: AuthStateDidChangeListenerHandle?
    
    
    override func viewDidDisappear(_ animated: Bool) {
        ref = Database.database().reference().child("Service")
        ref?.child("Service").removeAllObservers()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.serviceList.removeAll()
        self.tableView.reloadData()
        
        spinner.isHidden = false
        spinner.startAnimating()
        
        self.ref = Database.database().reference().child("Service")
        self.ref?.observe(.childAdded, with: { (snapshot) in
            if snapshot.exists(){
                let snapshotValue = snapshot.value as! NSDictionary
                let seller = snapshotValue["Seller"] as! String
                let name = snapshotValue["ServiceName"] as! String
                let desc = snapshotValue["description"] as! String
                let image = snapshotValue["imageUrl"] as! String
                let price = snapshotValue["price"] as! String
                let service = Service(seller: seller, price: price, image: image, name: name, description: desc)
                self.serviceList.append(service)
                self.tableView.reloadData()
            }else{
                //none
            }
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spinner.isHidden = true
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return serviceList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceCell", for: indexPath) as? ServiceCell{
            
            cell.serviceSeller.text = serviceList[indexPath.row].seller
            cell.serviceDsc.text = serviceList[indexPath.row].description
            //cell.serviceImg.text = serviceList[indexPath.row].image
            cell.serviceName.text = serviceList[indexPath.row].name
            cell.servicePrice.text = serviceList[indexPath.row].price
            cell.views.layer.cornerRadius = 10
            return cell
        }else{
            return ServiceCell()
        }
    }
    

   

}
