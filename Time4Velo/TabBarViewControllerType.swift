//
//  TabBarViewControllerType.swift
//  Time4Velo
//
//  Created by Patryk Bejgrowicz on 17.07.2017.
//  Copyright © 2017 Patryk Bejgrowicz. All rights reserved.
//

import Foundation
import UIKit

enum TabBarViewControllerType: String {
    case activity = "Activity"
    case history = "History"
    case profile = "Profile"
    
    static func toViewControllerType(_ type: TabBarViewControllerType) -> ViewControllerType {
        switch type {
        case .activity:
            return ViewControllerType.activity
        case .history:
            return ViewControllerType.history
        case .profile:
            return ViewControllerType.profile
        }
    }
}
