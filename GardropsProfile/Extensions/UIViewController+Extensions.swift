//
//  UIViewController+Extensions.swift
//  GardropsProfile
//
//  Created by Şehriban Yıldırım on 22.03.2024.
//

import UIKit

extension UIViewController: PannableViewsProtocol{
    
    static func instantiate(fromAppStoryboard appStoryboard: UIStoryboard) -> Self {
        return appStoryboard.viewController(viewControllerClass: self)
    }
    
    class var storyboardID : String {return "\(self)"}
    
    func add(_ child: UIViewController, to: UIView? = nil, frame: CGRect? = nil) {
        addChild(child)
        if let frame = frame {
            child.view.frame = frame
        }
        if let toView = to{
            toView.addSubview(child.view)
        }else{
            view.addSubview(child.view)
        }
        child.didMove(toParent: self)
    }
    
    var bottomInset: CGFloat{
        if #available(iOS 11.0, *) {
            return view.safeAreaInsets.bottom
        } else {
            return bottomLayoutGuide.length
        }
    }
    
    var topInset: CGFloat{
        if #available(iOS 11.0, *) {
            return view.safeAreaInsets.top
        } else {
            return topLayoutGuide.length
        }
    }
    
    func tp_configure(with dataSource: DataSource, delegate: ProgressDelegate? = nil) {
        let vc = ContainerViewController()
        vc.dataSource = dataSource
        vc.delegate = delegate
        self.add(vc)
        vc.view.pinEdges(to: self.view)
    }

    
    @objc open func panView() -> UIView{
        if let scroll = self.view.subviews.first(where: {$0 is UIScrollView}){
            return scroll
        }else{
            return self.view
        }
    }
}
