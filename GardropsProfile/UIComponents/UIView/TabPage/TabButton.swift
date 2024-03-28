//
//  TabButton.swift
//  GardropsProfile
//
//  Created by Şehriban Yıldırım on 26.03.2024.
//

import UIKit

class TabButton: UIButton {
    
    var selectedTextColor: UIColor? { willSet { setTitleColor(newValue, for: .normal) } }
    var selectedBackgroundColor: UIColor? { willSet { backgroundColor = newValue } }
    var selectedBorderWidth: CGFloat? { willSet { if let newValue = newValue { layer.borderWidth = newValue } } }
    var selectedBorderCornerRadius: CGFloat? { willSet { if let newValue = newValue { layer.cornerRadius = newValue } } }
    var selectedBorderColor: UIColor? { willSet { layer.borderColor = newValue?.cgColor } }
    var selectedTextFont: UIFont? { willSet { titleLabel?.font = newValue } }
    var unselectedTextColor: UIColor? { willSet { setTitleColor(newValue, for: .normal) } }
    var unselectedBackgroundColor: UIColor? { willSet { backgroundColor = newValue } }
    var unselectedBorderWidth: CGFloat? { willSet { if let newValue = newValue { layer.borderWidth = newValue } } }
    var unselectedBorderCornerRadius: CGFloat? { willSet { if let newValue = newValue { layer.cornerRadius = newValue } } }
    var unselectedBorderColor: UIColor? { willSet { layer.borderColor = newValue?.cgColor } }
    var unselectedTextFont: UIFont? { willSet { titleLabel?.font = newValue } }
    var selectedIconColor: UIColor? { willSet { tintColor = newValue }}
    var unSelectedIconColor: UIColor? { willSet { tintColor = newValue }}
    var isBottomSheetButton: Bool?
    
    override var isEnabled: Bool {
        didSet {
            setButton(isEnabled: isEnabled)
        }
    }
    
    func setButton(isEnabled: Bool) {
        if !isEnabled {
            
            setTitleColor(selectedTextColor, for: .normal)
            
            if isBottomSheetButton ?? false {
                backgroundColor = .appWhite
            } else {
                backgroundColor = .appWhite
            }
            
            if let selectedBorderWidth = selectedBorderWidth {
                layer.borderWidth = selectedBorderWidth
            }
            
            if let selectedBorderCornerRadius = selectedBorderCornerRadius {
                layer.cornerRadius = selectedBorderCornerRadius
            }
            
            if let selectedIconColor = selectedIconColor {
                tintColor = selectedIconColor
            }
            
            layer.borderColor = selectedBorderColor?.cgColor
            titleLabel?.font  = selectedTextFont
            
        } else {

            setTitleColor(unselectedTextColor, for: .normal)
            tintColor = selectedTextColor

            if isBottomSheetButton ?? false {
                backgroundColor = .appWhite
            } else {
                backgroundColor = .appWhite
            }

            if let unselectedBorderWidth = unselectedBorderWidth {
                layer.borderWidth = unselectedBorderWidth
            }
            
            if let unselectedBorderCornerRadius = unselectedBorderCornerRadius {
                layer.cornerRadius = unselectedBorderCornerRadius
            }
            
            if let unSelectedIconColor = unSelectedIconColor {
                tintColor = unSelectedIconColor
            }
            
            layer.borderColor = unselectedBorderColor?.cgColor
            titleLabel?.font  = unselectedTextFont
            
        }
    }
}
