//
//  ProgressDelegate.swift
//  GardropsProfile
//
//  Created by Şehriban Yıldırım on 22.03.2024.
//

import UIKit

public protocol ProgressDelegate: AnyObject{
    func tp_scrollView(_ scrollView: UIScrollView, didUpdate progress: CGFloat)
    func tp_scrollViewDidLoad(_ scrollView: UIScrollView)
}
