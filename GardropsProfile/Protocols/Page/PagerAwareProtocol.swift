//
//  PagerAwareProtocol.swift
//  GardropsProfile
//
//  Created by Şehriban Yıldırım on 22.03.2024.
//

import UIKit

public protocol PagerAwareProtocol: AnyObject {
    var pageDelegate: BottomPageDelegate? {get set}
    var currentViewController: UIViewController? {get}
}
