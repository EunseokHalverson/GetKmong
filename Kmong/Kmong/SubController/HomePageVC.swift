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
    var pageControl: UIPageControl = UIPageControl(frame: CGRect(x: 10, y: 20, width: 50, height: 30))
    
    
    private let contentImages = ["icons8-comedy-2-filled-100", "images", "back","back"]
    
    func configurePageControl() {
        self.pageControl.numberOfPages = contentImages.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.red
        self.pageControl.pageIndicatorTintColor = UIColor.black
        self.pageControl.currentPageIndicatorTintColor = UIColor.green
        self.view.addSubview(pageControl)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPageViewController()
        configurePageControl()
//        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.autoUpdate), userInfo: nil, repeats: true)
    }
    
    override func setViewControllers(_ viewControllers: [UIViewController]?, direction: UIPageViewControllerNavigationDirection, animated: Bool, completion: ((Bool) -> Void)? = nil) {
        print("2")
    }
    private func createPageViewController() {
        
        let pageController = self.storyboard!.instantiateViewController(withIdentifier: "PageController") as! UIPageViewController
        
        pageController.dataSource = self
        
        if contentImages.count > 0 {
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
        if itemController.itemIndex+1 < contentImages.count {
            
            return getItemController(itemIndex: itemController.itemIndex+1)
        }
        
        return nil
    }
    
    private func getItemController(itemIndex: Int) -> PageView? {
        
        if itemIndex < contentImages.count {
            let pageItemController = self.storyboard!.instantiateViewController(withIdentifier: "PageView") as! PageView
            pageItemController.itemIndex = itemIndex
            pageItemController.imageName = contentImages[itemIndex]
            return pageItemController
        }
        
        return nil
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return contentImages.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
