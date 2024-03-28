//
//  TabPageDelegate.swift
//  GardropsProfile
//
//  Created by Şehriban Yıldırım on 26.03.2024.
//

import UIKit

public protocol TabPageDelegate: NSObjectProtocol {
    func tabPage(didSelectAt index: Int)
}
