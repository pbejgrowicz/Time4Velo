//
//  LoginViewController.swift
//  Time4Velo
//
//  Created by Patryk Bejgrowicz on 17.07.2017.
//  Copyright © 2017 Patryk Bejgrowicz. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        bindValues()
    }
}

extension LoginViewController {
    
    func setup() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        loginTextField.placeholder = "Login"
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
    }
    
    func bindValues() {
        loginButton.rx.tap
            .asObservable()
            .subscribe(onNext: { _ in
                MainViewController.sharedInstance.changeToControllerType(.tabBar)
            })
            .disposed(by: bag)
        
        registerButton.rx.tap
            .asObservable()
            .subscribe(onNext: { _ in
                let vc = ViewControllerFactory.viewControllerWithType(.register)
                self.navigationController?.pushViewController(vc, animated: true)
            })
            .disposed(by: bag)
    }
}
