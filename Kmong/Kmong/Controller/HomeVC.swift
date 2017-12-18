//
//  HomeVC.swift
//  Kmong
//
//  Created by Eunseok on 2017. 12. 16..
//  Copyright © 2017년 Eunseok. All rights reserved.
//

import UIKit

class HomeVC: UIViewController{

    @IBOutlet weak var scroll: UIScrollView!
    
    @IBOutlet weak var homeTableView: UIView!
    @IBOutlet weak var homeUrlView: UIView!
    @IBOutlet weak var homeCollectionView: UIView!
    @IBOutlet weak var homePageView: UIView!

    
    var pageVC: UIViewController!
    var collectionVC: UIViewController!
    var urlVC: UIViewController!
    var tableVC: UIViewController!
    
    var viewControllers: [UIViewController]!
    var uiViews : [UIView]!
    
    var index: Int = 0

    override func viewDidLoad() {
        scroll.showsVerticalScrollIndicator = false
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        pageVC = storyboard.instantiateViewController(withIdentifier: "HomePageView")
        collectionVC = storyboard.instantiateViewController(withIdentifier: "HomeCollectionView")
        urlVC = storyboard.instantiateViewController(withIdentifier: "HomeUrlView")
        tableVC = storyboard.instantiateViewController(withIdentifier: "HomeTableView")
       
        
        viewControllers = [pageVC, collectionVC, urlVC, tableVC]
        uiViews = [homePageView, homeCollectionView, homeUrlView, homeTableView]
        
        for index in 0...3{
            let vc = viewControllers[index]
            addChildViewController(vc)
            vc.view.frame = uiViews[index].bounds
            uiViews[index].addSubview(vc.view)
            vc.didMove(toParentViewController: self)
        }
        
        
    }
}
