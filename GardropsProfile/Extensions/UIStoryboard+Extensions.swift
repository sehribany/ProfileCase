//
//  UIStoryboard+Extensions.swift
//  GardropsProfile
//
//  Created by Şehriban Yıldırım on 22.03.2024.
//

import UIKit

extension UIStoryboard{
    func viewController<T : UIViewController>(viewControllerClass : T.Type, function : String = #function, line : Int = #line, file : String = #file) -> T {
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        guard let scene = self.instantiateViewController(withIdentifier: storyboardID) as? T else {fatalError()}
        return scene
    }
    
    static var MainStoryBoard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: bundle)
    }
    
    private static var bundle: Bundle {
        return Bundle.main
    }
}
