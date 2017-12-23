//
//  HomeItemsVC.swift
//  Kmong
//
//  Created by Eunseok on 2017. 12. 19..
//  Copyright © 2017년 Eunseok. All rights reserved.
//

import UIKit

class HomeItemsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var itemTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemTable.dataSource = self
        itemTable.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.getItems().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "items") as? ItemCell{
            let item = DataService.instance.getItems()[indexPath.row]
            cell.updateView(item: item)
            return cell
        }else{
            return ItemCell()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.frame = CGRect(x: 5, y: 5, width: 35, height: 35)

        return view
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "ASDSD"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
}
