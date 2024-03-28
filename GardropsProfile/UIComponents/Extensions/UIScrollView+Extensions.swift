//
//  UIScrollView+Extensions.swift
//  GardropsProfile
//
//  Created by Şehriban Yıldırım on 22.03.2024.
//

import UIKit

public extension UIScrollView{
    func donotAdjustContentInset(){
        if #available(iOS 11.0, *) {
            self.contentInsetAdjustmentBehavior = .never
        }
    }
}
