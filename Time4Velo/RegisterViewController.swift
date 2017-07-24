//
//  RegisterViewController.swift
//  Time4Velo
//
//  Created by Patryk Bejgrowicz on 17.07.2017.
//  Copyright © 2017 Patryk Bejgrowicz. All rights reserved.
//

import FirebaseAuth
import RxSwift
import RxCocoa

class RegisterViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    let bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        setup()
        bindValues()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func setup() {
        title = "Register"
        navigationController?.navigationBar.tintColor = .orange
        emailTextField.placeholder = "email"
        passwordTextField.placeholder = "password"
        confirmPasswordTextField.placeholder = "confirm password"
        passwordTextField.isSecureTextEntry = true
        confirmPasswordTextField.isSecureTextEntry = true
    }
    
    func handleRegister() {
        if passwordTextField.text == confirmPasswordTextField.text {
            guard let email = emailTextField.text, let password = passwordTextField.text else {
                return
            }
            Auth.auth().createUser(withEmail: email, password: password) { (user , error) in
                if let error = error {
                    print(error)
                    return
                }
                
                print("\(user!.email!) created")
                user?.sendEmailVerification()
                UserDefaultsService.setValue(user?.uid, forKey: .authToken)
                self.navigationController!.popViewController(animated: true)
            }
        }
    }
    
    func bindValues() {
        registerButton.rx.tap
            .asObservable()
            .subscribe(onNext: { _ in
                self.handleRegister()
            })
            .disposed(by: bag)
        
    }

}
