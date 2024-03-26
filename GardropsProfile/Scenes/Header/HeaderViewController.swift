//
//  HeaderViewController.swift
//  GardropsProfile
//
//  Created by Şehriban Yıldırım on 22.03.2024.
//
import TinyConstraints
import UIKit

class HeaderViewController: UIViewController {

    var lastProgress       : CGFloat = .zero
    var lastMinHeaderHeight: CGFloat = .zero
    var covernitialHeight  : CGFloat!
    var stickyCover = true

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.update(with: lastProgress, minHeaderHeight: lastMinHeaderHeight)
    }

    func update(with progress: CGFloat, minHeaderHeight: CGFloat){
        lastProgress = progress
        lastMinHeaderHeight = minHeaderHeight
        
        let y = progress * (view.frame.height - minHeaderHeight)
        
        guard covernitialHeight != nil else {return}
        
        let topLimit = covernitialHeight - minHeaderHeight
        if y > topLimit{
            if stickyCover{
                self.stickyCover = false
            }
        }else{
            let scale = min(1, (1-progress*1.3))
            _ = CGAffineTransform(scaleX: scale, y: scale)
            
            if !stickyCover{
                self.stickyCover = true
            }
        }
    }
}
