//
//  CategoryVC.swift
//  Kmong
//
//  Created by Eunseok on 2017. 12. 14..
//  Copyright © 2017년 Eunseok. All rights reserved.
//

import UIKit

class CategoryVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.getPageCategories().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as? CategoryCell{
            let category = DataService.instance.getPageCategories()[indexPath.row]
            cell.updateView(category: category)
            return cell
        }else{
            return CategoryCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            performSegue(withIdentifier: "categoryToMyself", sender: nil)
        }else if indexPath.row == 1{
            performSegue(withIdentifier: "categoryToEducation", sender: nil)
        }else if indexPath.row == 2{
            performSegue(withIdentifier: "categoryToExperience", sender: nil)
        }else{
            performSegue(withIdentifier: "categoryToContact", sender: nil)
        }
    }


    

}
