//
//  ViewControllerType.swift
//  Time4Velo
//
//  Created by Patryk Bejgrowicz on 17.07.2017.
//  Copyright © 2017 Patryk Bejgrowicz. All rights reserved.
//

import Foundation

enum ViewControllerType: String {
    case main = "MainNavigation"
    case login = "LoginNavigation"
    case forgotPassword = "ForgotPasswordView"
    case register = "RegisterView"
    case tabBar = "TabBarNavigation"
    case activity = "ActivityNavigation"
    case history = "HistoryNavigation"
    case profile = "ProfileNavigation"
    
    var storyboardName: String {
        switch self {
        case .main:
            return "Main"
        case .login:
            return "Login"
        case .forgotPassword:
            return "ForgotPassword"
        case .register:
            return "Register"
        case .tabBar:
            return "TabBar"
        case .activity:
            return "Activity"
        case .history:
            return "History"
        case .profile:
            return "Profile"
        }
    }
}
