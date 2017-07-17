//
//  ViewControllerFactory.swift
//  Time4Velo
//
//  Created by Patryk Bejgrowicz on 17.07.2017.
//  Copyright © 2017 Patryk Bejgrowicz. All rights reserved.
//

import UIKit

class ViewControllerFactory: NSObject {
    static func viewControllerWithType(_ viewControllerType: ViewControllerType) -> UIViewController {
        let controller = createViewController(withType: viewControllerType)
        //let viewController = getViewController(fromController: controller)
        
//        if var viewControllerWithPresenter = viewController as? ViewProtocol,
//            let presenterType = PresenterType.value(forViewControllerType: viewControllerType) {
//            viewControllerWithPresenter.presenter = createPresenter(withType: presenterType, forController: viewController)
//        }
        
        return controller
    }
}

private extension ViewControllerFactory {
    static func getViewController(fromController controller: UIViewController) -> UIViewController {
        if let navigationController = controller as? UINavigationController,
            let rootViewController = navigationController.viewControllers.first {
            return rootViewController
        } else {
            return controller
        }
    }
    
//    static func createPresenter(withType presenterType: PresenterType, forController viewController: UIViewController) -> PresenterProtocol {
//        switch presenterType {
//        case .example:
//            return ExamplePresenter(controller: viewController)
//        }
//    }
    
    static func createViewController(withType viewControllerType: ViewControllerType) -> UIViewController {
        let storyborad = UIStoryboard(name: viewControllerType.storyboardName, bundle: nil)
        return storyborad.instantiateViewController(withIdentifier: storyboardIdentifierWithType(viewControllerType.rawValue))
    }

    static func storyboardIdentifierWithType (_ viewControllerType: String) -> String {
        return "\(viewControllerType)ControllerStoryboardIdentifier"
    }
}

