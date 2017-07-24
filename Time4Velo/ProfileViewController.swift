//
//  ProfileViewController.swift
//  Time4Velo
//
//  Created by Patryk Bejgrowicz on 17.07.2017.
//  Copyright © 2017 Patryk Bejgrowicz. All rights reserved.
//

import RxCocoa
import RxSwift

class ProfileViewController: UIViewController {
    @IBOutlet weak var logoutButton: UIButton!
    
    var bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindValues()
        
    }
    
    func bindValues() {
        logoutButton.rx.tap
            .asObservable()
            .subscribe(onNext: { _ in
                MainViewController.sharedInstance.logout()
            })
            .disposed(by: bag)
    }

}
