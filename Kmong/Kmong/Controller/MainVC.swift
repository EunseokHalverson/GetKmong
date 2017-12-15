//
//  mainVC.swift
//  Kmong
//
//  Created by Eunseok on 2017. 12. 13..
//  Copyright © 2017년 Eunseok. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        spinner.startAnimating()
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateView), userInfo: nil, repeats: false)
    }

    @objc func updateView(){
        performSegue(withIdentifier: "toKmongVC", sender: nil)
    }
    

}
