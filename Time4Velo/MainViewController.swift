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
}

