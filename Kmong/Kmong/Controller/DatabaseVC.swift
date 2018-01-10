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
    

    
    override func viewWillAppear(_ animated: Bool) {
        
        self.serviceList.removeAll()
        self.tableView.reloadData()
        
        spinner.isHidden = false
        tempView.isHidden = false
        spinner.startAnimating()
        
        
        self.ref = Database.database().reference().child("Service")
        self.ref?.observe(.childAdded, with: { (snapshot) in
            let snapshotValue = snapshot.value as! NSDictionary
            let seller = snapshotValue["seller"] as! String
            let desc = snapshotValue["description"] as! String
            let image = snapshotValue["imageUrl"] as! String
            let price = snapshotValue["price"] as! String
            let rating = snapshotValue["rating"] as! Double
            
            let storage = Storage.storage()
            let storageRef = storage.reference()
            let islandRef = storageRef.child("Images/\(image).png")
            islandRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    let image = UIImage(data: data!)
                    let service = Service(seller: seller, price: price, image: image,  description: desc, rating: rating)
                    
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
        spinner.isHidden = true
        tempView.isHidden = true
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
            cell.servicePrice.text = serviceList[indexPath.row].price
            cell.serviceImg.image = serviceList[indexPath.row].image
            
            let starRatingView = SwiftyStarRatingView()
            starRatingView.frame = cell.ratingBar.bounds
            starRatingView.allowsHalfStars = true
            starRatingView.maximumValue = 5         //default is 5
            starRatingView.minimumValue = 0         //default is 0
            starRatingView.value = CGFloat(serviceList[indexPath.row].rating!)
            starRatingView.tintColor = #colorLiteral(red: 0.9837014079, green: 0.8553137183, blue: 0.3496560156, alpha: 1)
            
            cell.ratingBar.addSubview(starRatingView)
            cell.views.layer.cornerRadius = 10
            cell.views.layer.borderWidth = 1
            cell.views.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            return cell
        }else{
            return ServiceCell()
        }
    }
    

   

}
