//
//  ActivityViewController.swift
//  Time4Velo
//
//  Created by Patryk Bejgrowicz on 17.07.2017.
//  Copyright © 2017 Patryk Bejgrowicz. All rights reserved.
//

import RxCocoa
import RxSwift
import MapKit
import CoreLocation

class ActivityViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var recordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
