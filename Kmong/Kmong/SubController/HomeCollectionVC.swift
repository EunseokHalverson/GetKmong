//
//  HomeCollectionVC.swift
//  Kmong
//
//  Created by Eunseok on 2017. 12. 17..
//  Copyright © 2017년 Eunseok. All rights reserved.
//

import UIKit

class HomeCollectionVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var categoryCollection: UICollectionView!
    private(set) public var categories = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryCollection.dataSource = self
        categoryCollection.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataService.instance.getCategories().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? CategoryCollectionCell{
            let category = DataService.instance.getCategories()[indexPath.row]
            cell.updateViews(category: category)
            return cell
        }
        return CategoryCollectionCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView.cellForItem(at: indexPath) != nil {
            if indexPath.row == 0{
                updateCollectionCell(identifier: "categoryToMyself")
            }else if indexPath.row == 1{
                updateCollectionCell(identifier: "categoryToEducation")
            }else if indexPath.row == 2{
                updateCollectionCell(identifier: "categoryToExperience")
            }else{
                updateCollectionCell(identifier: "categoryToContact")
            }
        }
    }
    
    func updateCollectionCell(identifier: String){
        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier) as UIViewController
        self.present(viewController, animated: false, completion: nil)
    }
}
