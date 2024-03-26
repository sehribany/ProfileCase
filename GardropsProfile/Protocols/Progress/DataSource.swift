//
//  DataSource.swift
//  GardropsProfile
//
//  Created by Şehriban Yıldırım on 22.03.2024.
//

import UIKit

public protocol DataSource: AnyObject {
    func headerViewController() -> UIViewController
    func bottomViewController() -> UIViewController & PagerAwareProtocol
    func minHeaderHeight() -> CGFloat
}
