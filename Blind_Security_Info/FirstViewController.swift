//  FirstViewController.swift
//  Blind_Security_Info
//
//  Created by Nick on 18/08/2017.
//  Copyright © 2017 Nick. All rights reserved.
//

import GoogleMaps
import UIKit
import CoreLocation

class FirstViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate {
    var locationManager: CLLocationManager = CLLocationManager()
//    var currLocation: CLLocationManager
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(button)
        view.addSubview(label)
        view.setNeedsUpdateConstraints()

        
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
            print("Start updating")
    }

//    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [CLLocation]) {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        print(locations.count)
        let newLocation: CLLocation = locations.last!
        reverseGeocodeCoordinate(coordinate: newLocation.coordinate)
    }
    
//    func locationManager(manager: CLLocationManager!, didFailWithError error: Error!)
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error Occurs")
        print(error)
    }

    func reverseGeocodeCoordinate(coordinate: CLLocationCoordinate2D) {
        let geocoder = GMSGeocoder()
        geocoder.reverseGeocodeCoordinate(coordinate) { response, error in
            if let address = response?.firstResult() {
                let lines = address.lines!
                self.label.text = lines.joined(separator: "\n")
            }
        }
    }
    func buttonPressed() {
//        var coord = locationManager.location?.coordinate
//        label.text = "\(coord?.latitude)"
//        
    }

    override func updateViewConstraints() {
        buttonConstraints()
        labelConstraints()
        
        super.updateViewConstraints()
    }
    
    func labelConstraints() {
        NSLayoutConstraint(
            item: label,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: view,
            attribute: .centerX,
            multiplier: 1.0,
            constant: 0.0)
            .isActive = true
        
        NSLayoutConstraint(
            item: label,
            attribute: .width,
            relatedBy: .equal,
            toItem: view,
            attribute: .width,
            multiplier: 0.8,
            constant: 0.0)
            .isActive = true
        
        NSLayoutConstraint(
            item: label,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: view,
            attribute: .centerY,
            multiplier: 1.5,
            constant: 0.0)
            .isActive = true
        
    }
    
    func buttonConstraints() {
        NSLayoutConstraint(
            item: button,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: view,
            attribute: .centerX,
            multiplier: 2.0,
            constant: 0.0)
            .isActive = true
        
        NSLayoutConstraint(
            item: button,
            attribute: .width,
            relatedBy: .equal,
            toItem: view,
            attribute: .width,
            multiplier: 0.3,
            constant: 0.0)
            .isActive = true
        
        NSLayoutConstraint(
            item: button,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: view,
            attribute: .bottom,
            multiplier: 0.1,
            constant: 0.0)
            .isActive = true
        
    }
    
    lazy var button: UIButton! =  {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action:#selector(buttonPressed), for: .touchUpInside)
        view.setTitle("Press me!", for: .normal)
        view.backgroundColor = UIColor.blue
        return view
    }()
    
    lazy var label: UILabel! = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.text = "Hello world!"
        view.textAlignment = .center
        view.numberOfLines = 0
        return view
    }()
}
