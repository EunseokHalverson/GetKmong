//
//  MessageCell.swift
//  Kmong
//
//  Created by Eunseok on 2018. 1. 8..
//  Copyright © 2018년 Eunseok. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var views: UIView!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var bodyLbl: UILabel!
    @IBOutlet weak var fromLbl: UILabel!
    
    func updateView(msg: Message){
        timeLbl.text = msg.date
        bodyLbl.text = msg.body
        fromLbl.text = msg.from
        views.layer.cornerRadius = 5
    }

}
