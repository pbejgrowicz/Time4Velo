//
//  ViewController.swift
//  Time4Velo
//
//  Created by Patryk Bejgrowicz on 14.07.2017.
//  Copyright © 2017 Patryk Bejgrowicz. All rights reserved.
//

import UIKit
import Parse
import SnapKit
import RxSwift

class MainViewController: UIViewController {
    
    private let bag = DisposeBag()
    
    private var currentVC: UIViewController!
    
    static let sharedInstance: MainViewController = ViewControllerFactory.viewControllerWithType(.main) as! MainViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let token = UserDefaultsService.getValue(forKey: .authToken),
            token.characters.count > 0 {
            prepareRootController(rootViewController: ViewControllerFactory.viewControllerWithType(.tabBar))
        } else {
            prepareRootController(rootViewController: ViewControllerFactory.viewControllerWithType(.login))
        }
    }
    
    private func prepareRootController(rootViewController: UIViewController) {
        self.addChildViewController(rootViewController)
        view.addSubview(rootViewController.view)
        
        rootViewController.view.snp.makeConstraints { make in
            make.edges.equalTo(self.view)
        }
        rootViewController.view.layoutIfNeeded()
        view.layoutIfNeeded()
        
        rootViewController.didMove(toParentViewController: self.parent)
        currentVC = rootViewController
    }
    
    func changeToControllerType(_ type: ViewControllerType) {
        let newVC = ViewControllerFactory.viewControllerWithType(type)
        
        currentVC.willMove(toParentViewController: nil)
        addChildViewController(newVC)
        
        view.addSubview(newVC.view)
        newVC.view.snp.makeConstraints { make in
            make.edges.equalTo(self.view)
        }
        newVC.view.layoutIfNeeded()
        
        newVC.view.alpha = 0.0
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseInOut, animations: {
            newVC.view.alpha = 1
        }) { _ in
            self.currentVC.view.removeFromSuperview()
            self.currentVC.removeFromParentViewController()
            newVC.didMove(toParentViewController: self)
            self.currentVC = newVC
        }
    }
}

