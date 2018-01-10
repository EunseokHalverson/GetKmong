//
//  HomeVC.swift
//  Kmong
//
//  Created by Eunseok on 2017. 12. 16..
//  Copyright © 2017년 Eunseok. All rights reserved.
//

import UIKit


class HomeVC: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var homeCollectionView: UIView!
    @IBOutlet weak var homePageView: UIView!
    @IBOutlet weak var homeUrlView: UIView!
    @IBOutlet weak var tableView: UITableView!
    

    var pageVC: UIViewController!
    var collectionVC: UIViewController!
    var urlVC: UIViewController!
    
    var viewControllers: [UIViewController]!
    var uiViews : [UIView]!
    
    var index: Int = 0
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.getItems().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "items") as? ItemCell{
            let item = DataService.instance.getItems()[indexPath.row]
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.updateView(item: item)

            return cell
        }else{
            return CategoryCell()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        pageVC = storyboard.instantiateViewController(withIdentifier: "HomePageView")
        collectionVC = storyboard.instantiateViewController(withIdentifier: "HomeCollectionView")
        urlVC = storyboard.instantiateViewController(withIdentifier: "HomeUrlView")
       
        
        viewControllers = [pageVC, collectionVC, urlVC]
        uiViews = [homePageView, homeCollectionView, homeUrlView]
        
        for index in 0...2{
            let vc = viewControllers[index]
            addChildViewController(vc)
            vc.view.frame = uiViews[index].bounds
            uiViews[index].addSubview(vc.view)
            vc.didMove(toParentViewController: self)
        }
        
        
    }
    
    func updateCollectionCell(identifier: String){
        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier) as UIViewController
        self.present(viewController, animated: false, completion: nil)
    }
    
    @IBAction func toMyselfPressed(_ sender: Any) {
        updateCollectionCell(identifier: "categoryToMyself")
    }
    @IBAction func educationPressed(_ sender: Any) {
        updateCollectionCell(identifier: "categoryToEducation")
    }

    @IBAction func contactPressed(_ sender: Any) {
        updateCollectionCell(identifier: "categoryToContact")
    }
    @IBAction func expPressed(_ sender: Any) {
        updateCollectionCell(identifier: "categoryToExperience")
    }
    
}
