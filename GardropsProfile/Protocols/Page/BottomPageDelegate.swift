//
//  BottomPageDelegate.swift
//  GardropsProfile
//
//  Created by Şehriban Yıldırım on 22.03.2024.
//

import UIKit

public protocol BottomPageDelegate: AnyObject {
    func tp_pageViewController(_ currentViewController: UIViewController?, didSelectPageAt index: Int)
}
