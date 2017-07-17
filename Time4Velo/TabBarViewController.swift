//
//  TabBarViewController.swift
//  Time4Velo
//
//  Created by Patryk Bejgrowicz on 17.07.2017.
//  Copyright © 2017 Patryk Bejgrowicz. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    var tabs = [TabBarViewControllerType.activity,
                TabBarViewControllerType.history,
                TabBarViewControllerType.profile]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //delegate = self
        prepareControllers()
        prepareTabs()
    }
}

private extension TabBarViewController {
    func prepareControllers() {
        var controllers: [UIViewController] = []
        tabs.enumerated().forEach { (_,type: TabBarViewControllerType) in
            controllers.append(ViewControllerFactory.viewControllerWithType(TabBarViewControllerType.toViewControllerType(type)))
        }
        viewControllers = controllers
    }
    
    func prepareTabs() {
        for (n, c) in self.tabs.enumerated() {
            let tabBarItem = tabBar.items?[n]
            tabBarItem?.title = c.rawValue
            //tabBarItem?.image = imageForType(type: c)
        }
    }
    
//    func imageForType(type: TabBarViewControllerType) -> UIImage {
//        switch type {
//        case .booking:
//            return #imageLiteral(resourceName: "booking_icon")
//        case .bookingHistory:
//            return #imageLiteral(resourceName: "history_icon")
//        case .account:
//            return #imageLiteral(resourceName: "dollar_icon")
//        case .freeService:
//            return #imageLiteral(resourceName: "free_service_icon")
//        case .help:
//            return #imageLiteral(resourceName: "account_icon")
//        }
//    }
}
