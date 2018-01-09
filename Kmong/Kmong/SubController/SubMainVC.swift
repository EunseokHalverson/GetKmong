//
//  HomeVC.swift
//  Kmong
//
//  Created by Eunseok on 2017. 12. 14..
//  Copyright © 2017년 Eunseok. All rights reserved.
//

import UIKit
import Firebase

class SubMainVC: UIViewController {

   
    @IBOutlet var tabs: [UIButton]!
    
  
    @IBOutlet weak var contentView: UIView!
    
    var hmVC: UIViewController!
    var categoryVC: UIViewController!
    var messageVC: UIViewController!
    var alertVC: UIViewController!
    var menuVC: UIViewController!
    
    var viewControllers: [UIViewController]!
    
    var index: Int = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
  
        hmVC = storyboard.instantiateViewController(withIdentifier: "Home")
        categoryVC = storyboard.instantiateViewController(withIdentifier: "Category")
        messageVC = storyboard.instantiateViewController(withIdentifier: "Message")
        alertVC = storyboard.instantiateViewController(withIdentifier: "Alert")
        menuVC = storyboard.instantiateViewController(withIdentifier: "Menu")
        
        viewControllers = [hmVC, categoryVC, messageVC, alertVC, menuVC]
        
        tabs[index].isSelected = true
        tabPressed(tabs[index])
    }
    
    @IBAction func tabPressed(_ sender: UIButton) {
        let previouseIndex = index
        index = sender.tag
        tabs[previouseIndex].isSelected = false
        let previousVC = viewControllers[previouseIndex]
        
        previousVC.willMove(toParentViewController: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        sender.isSelected = true
        let vc = viewControllers[index]
        
        addChildViewController(vc)
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        vc.didMove(toParentViewController: self)
        
        
        if index == 2 && Auth.auth().currentUser == nil {
            
            let alert = UIAlertController(title: "메세지를 보시려면 로그인해주세요.",
                                          message: "",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { (success) in
                if success.isEnabled == true {
                    self.tabs[previouseIndex].isSelected = false
                    let previousVC = self.viewControllers[previouseIndex]
                    
                    previousVC.willMove(toParentViewController: nil)
                    previousVC.view.removeFromSuperview()
                    previousVC.removeFromParentViewController()
                    
                    sender.isSelected = true
                    let vc = self.viewControllers[4]
                    
                    self.addChildViewController(vc)
                    vc.view.frame = self.contentView.bounds
                    self.contentView.addSubview(vc.view)
                    vc.didMove(toParentViewController: self)
                }
            }))
            self.present(alert, animated: true)
        }
        
    }

    

}
