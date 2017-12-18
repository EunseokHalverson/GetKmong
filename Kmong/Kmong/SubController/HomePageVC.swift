//
//  HomePageVC.swift
//  Kmong
//
//  Created by Eunseok on 2017. 12. 16..
//  Copyright © 2017년 Eunseok. All rights reserved.
//

import UIKit

class HomePageVC: UIPageViewController, UIPageViewControllerDataSource, UIScrollViewDelegate{
    
    private var pageViewController: UIPageViewController?
    
    var pageControl: UIPageControl = UIPageControl(frame: CGRect(x: 20, y: 20, width: 50, height: 30))
    
    
    func configurePageControl() {
        self.pageControl.numberOfPages = DataService.instance.getValues().count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.red
        self.pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.9399758577, green: 0.9343879819, blue: 0.9442710876, alpha: 0.7223351884)
        self.pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.view.addSubview(pageControl)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPageViewController()
        configurePageControl()
    }
    
    private func createPageViewController() {
        
        let pageController = self.storyboard!.instantiateViewController(withIdentifier: "PageController") as! UIPageViewController
        
        pageController.dataSource = self
        
        if DataService.instance.getValues().count > 0 {
            let firstController = getItemController(itemIndex: 0)!
            let startingViewControllers = [firstController]
            pageController.setViewControllers(startingViewControllers, direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
        }
        
        pageViewController = pageController
        addChildViewController(pageViewController!)
        self.view.addSubview(pageViewController!.view)
        pageViewController!.didMove(toParentViewController: self)
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let itemController = viewController as! PageView
        pageControl.currentPage = itemController.itemIndex
        if itemController.itemIndex > 0 {
            return getItemController(itemIndex: itemController.itemIndex-1)
        }
        
        return nil
    }
    
    @objc func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let itemController = viewController as! PageView
        pageControl.currentPage = itemController.itemIndex
        if itemController.itemIndex+1 < DataService.instance.getValues().count {
            
            return getItemController(itemIndex: itemController.itemIndex+1)
        }
        
        return nil
    }
    
    private func getItemController(itemIndex: Int) -> PageView? {
        
        if itemIndex < DataService.instance.getValues().count {
            let pageItemController = self.storyboard!.instantiateViewController(withIdentifier: "PageView") as! PageView
            pageItemController.itemIndex = itemIndex
            pageItemController.imageName = DataService.instance.getValues()[itemIndex].imageName
            pageItemController.lblText = DataService.instance.getValues()[itemIndex].title
            return pageItemController
        }
        
        return nil
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return DataService.instance.getValues().count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
