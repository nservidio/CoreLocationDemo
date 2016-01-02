//
//  ViewController.swift
//  CoreLocationDemo
//
//  Created by Nicholas Servidio on 1/2/16.
//  Copyright © 2016 Intrepid. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    private let locationManager = CLLocationManager()
    private var firstTimeFlag = true

    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLocationManager()
    }

    // MARK: Setups

    func setupLocationManager() {
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }

    // MARK: CLLocationManagerDelegate

    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if(self.firstTimeFlag) {
            print("First time")
            self.firstTimeFlag = false
        }

        var statusString : String
        switch status {
        case .NotDetermined:
            statusString = "Not Determined"
        case .AuthorizedWhenInUse:
            statusString = "Authorized"
        default:
            statusString = "Default"
        }
        print(statusString)
    }

    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations.first)
    }
}

