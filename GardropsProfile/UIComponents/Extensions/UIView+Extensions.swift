//
//  UIView+Extensions.swift
//  GardropsProfile
//
//  Created by Şehriban Yıldırım on 22.03.2024.
//

import UIKit

internal extension UIView{
    func constraint(to view: UIView, attribute: NSLayoutConstraint.Attribute, secondAttribute: NSLayoutConstraint.Attribute,  inset: CGFloat = 0){
        self.translatesAutoresizingMaskIntoConstraints = false
        let c = NSLayoutConstraint(item: self,
                                   attribute: attribute,
                                   relatedBy: .equal,
                                   toItem: view,
                                   attribute: secondAttribute,
                                   multiplier: 1,
                                   constant: inset)
        c.isActive = true
    }
    
    func constraint(_ anchor: NSLayoutDimension, constant: CGFloat){
        self.translatesAutoresizingMaskIntoConstraints = false
        anchor.constraint(equalToConstant: constant).isActive = true
    }
    
    func pinEdges(to view: UIView, insets: UIEdgeInsets = .zero){
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let top = NSLayoutConstraint(item: self,
                                     attribute: .top,
                                     relatedBy: .equal,
                                     toItem: view,
                                     attribute: .top,
                                     multiplier: 1,
                                     constant: insets.top)
        
        let bottom = NSLayoutConstraint(item: self,
                                        attribute: .bottom,
                                        relatedBy: .equal,
                                        toItem: view,
                                        attribute: .bottom,
                                        multiplier: 1,
                                        constant: insets.bottom)
        
        let leading = NSLayoutConstraint(item: self,
                                        attribute: .leading,
                                        relatedBy: .equal,
                                        toItem: view,
                                        attribute: .leading,
                                        multiplier: 1,
                                        constant: insets.left)
        
        let trailing = NSLayoutConstraint(item: self,
                                        attribute: .trailing,
                                        relatedBy: .equal,
                                        toItem: view,
                                        attribute: .trailing,
                                        multiplier: 1,
                                        constant: insets.right)
        top.isActive = true
        bottom.isActive = true
        leading.isActive = true
        trailing.isActive = true
    }
    
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        repeat{
            parentResponder = parentResponder?.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }while parentResponder != nil
    
        return nil
    }
}
