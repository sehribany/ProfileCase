//
//  MainViewController.swift
//  GardropsProfile
//
//  Created by Şehriban Yıldırım on 25.03.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    var headerVC: HeaderViewController!
    var bottomVC: BottomViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure(){
        DispatchQueue.main.async {
            self.tp_configure(with: self,delegate: self)
        }
    }
}

//MARK: - DataSource and ProgressDelegate
extension MainViewController: DataSource, ProgressDelegate{
    
    func headerViewController() -> UIViewController {
        headerVC = HeaderViewController.instantiate(fromAppStoryboard: .MainStoryBoard)
        return headerVC!
    }
    
    func bottomViewController() -> UIViewController & PagerAwareProtocol {
        bottomVC = BottomViewController.instantiate(fromAppStoryboard: .MainStoryBoard)
        return self.bottomVC
    }
    
    func minHeaderHeight() -> CGFloat {
        return topInset
    }
    
    func tp_scrollView(_ scrollView: UIScrollView, didUpdate progress: CGFloat) {
        headerVC?.update(with: progress, minHeaderHeight: minHeaderHeight())
    }
    
    func tp_scrollViewDidLoad(_ scrollView: UIScrollView) {}
}
