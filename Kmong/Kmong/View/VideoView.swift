//
//  VideoView.swift
//  Kmong
//
//  Created by Eunseok on 2017. 12. 19..
//  Copyright © 2017년 Eunseok. All rights reserved.
//

import UIKit
import AVKit

class VideoView: UIViewController {

    @IBOutlet weak var videoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let filePath = Bundle.main.path(forResource: "video", ofType: ".mp4") {
            let filePathURL = NSURL.fileURL(withPath: filePath)
            
            let player = AVPlayer(url: filePathURL)
            let playerController = AVPlayerViewController()
            playerController.player = player
            videoView.addSubview(playerController.view)
            playerController.view.frame = videoView.bounds
            self.present(playerController, animated: true) {
                player.play()
            }
        }
        
    }

    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
