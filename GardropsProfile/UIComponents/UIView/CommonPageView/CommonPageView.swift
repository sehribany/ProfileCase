//
//  CommonPageView.swift
//  GardropsProfile
//
//  Created by Şehriban Yıldırım on 23.03.2024.
//

import UIKit

class CommonPageView : UIView, TabPageDelegate {
    
    func tabPage(didSelectAt index: Int) {
        self.selectedIndex = index
        self.customSelectedIndex = index
        delegate?.scrollingDidEnd(index: index)
    }

    lazy var tabManager = TabPage()
    lazy var scrollView = UIScrollView()
    
    var setupTabPage: ((_ tabPage: TabPage, _ scrollView: UIScrollView)->())?
    
    var transitionComplete: Bool = false
    
    var animationComplete: Bool = false
        
    private var selectedIndex = 0
    
    var customSelectedIndex: Int = 0
    
    var delegate:CommonPageProtocol?
    
    var arrViewController : [UIViewController] = [] {
        didSet{
            tabManager.setWithControllers(data: [(title: "icGardrops", controller: arrViewController[0]), (title: "icFavorite", controller: arrViewController[1])], on: scrollView, delegate: self)
        }
    }
    
    func setViewController(index: Int)  {
        if let firstVC = arrViewController[exist : index] {
            DispatchQueue.main.async {
                self.selectedIndex = index
            }
        }
    }
        
    var selectionChange: ((Int) -> Void)?
    
    func setUpView() {
        
        let topView = UIView()
        topView.backgroundColor = .appWhite
        
        addSubview(topView)
        
        topView.translatesAutoresizingMaskIntoConstraints                   = false
        topView.topAnchor.constraint(equalTo: topAnchor).isActive           = true
        topView.heightAnchor.constraint(equalToConstant: 18).isActive       = true
        topView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive   = true
        topView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        tabManager.backgroundColor     = .clear
        tabManager.indicatorOffset     = -0.5
        tabManager.selectedTextFont    = UIFont.systemFont(ofSize: 13, weight: .semibold)
        tabManager.unselectedTextFont  = UIFont.systemFont(ofSize: 13, weight: .semibold)
        
        tabManager.isIconMode          = true
        
        tabManager.indicatorColor      = .appPink1
        tabManager.selectedIconColor   = .appPink2
        tabManager.unselectedIconColor = .appPink1
        tabManager.selectedLineView?.backgroundColor = .appPink2

            
        addSubview(tabManager)
            
        tabManager.translatesAutoresizingMaskIntoConstraints             = false
        tabManager.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        tabManager.heightAnchor.constraint(equalToConstant: 40).isActive = true
        tabManager.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        
      
        scrollView.backgroundColor = .clear
        
        addSubview(scrollView)

        scrollView.translatesAutoresizingMaskIntoConstraints                            = false
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive              = true
        scrollView.topAnchor.constraint(equalTo: tabManager.bottomAnchor).isActive      = true
        scrollView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
    }
}

extension Collection where Indices.Iterator.Element == Index {
    subscript (exist index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

