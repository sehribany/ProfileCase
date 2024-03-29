//
//  BottomViewController.swift
//  GardropsProfile
//
//  Created by Şehriban Yıldırım on 22.03.2024.
//

import UIKit

class BottomViewController: UIViewController{
    
    @IBOutlet weak var vwPageView: CommonPageView!
    
    var selectedIndex: Int = 0 {
        didSet {
            self.vwPageView.setViewController(index: self.selectedIndex)
            pageDelegate?.tp_pageViewController(self.vwPageView.arrViewController[self.selectedIndex], didSelectPageAt: self.selectedIndex)
        }
    }
    
    var pageDelegate: BottomPageDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    private func setUpView() {
        self.applyStyle()
        pageDelegate?.tp_pageViewController(self.vwPageView.arrViewController[self.selectedIndex], didSelectPageAt: self.selectedIndex)
    }
    
    private func applyStyle(){
        self.vwPageView.setUpView()
        let vc1 = GardropsViewController.instantiate(fromAppStoryboard: .MainStoryBoard)
        let vc2 = FavoriteViewController.instantiate(fromAppStoryboard: .MainStoryBoard)
        self.vwPageView.arrViewController = [vc1,vc2]
        self.vwPageView.delegate = self
        self.vwPageView.setViewController(index: self.selectedIndex)
    }
}

//MARK: - PagerAwareProtocol
extension BottomViewController: PagerAwareProtocol {
    var currentViewController: UIViewController?{
        return self.vwPageView.arrViewController[self.selectedIndex]
    }
}

//MARK: - CommonPageDelegate
extension BottomViewController: CommonPageProtocol {
    func scrollingDidEnd(index: Int) {
        self.selectedIndex = index
    }
}
