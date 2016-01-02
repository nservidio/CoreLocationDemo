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
    }

    // MARK : Actions

    @IBAction func didTapFindLocationButton(sender: AnyObject) {
        NSLog("About to start looking for location")
        self.locationManager.startUpdatingLocation()
        NSLog("Already started updating location")
    }

    // MARK: CLLocationManagerDelegate

    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if (self.firstTimeFlag) {
            NSLog("Found Location")
            NSLog("\(locations.first)")
            self.firstTimeFlag = false
        }
    }
}

