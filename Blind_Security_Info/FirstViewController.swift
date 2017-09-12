//  FirstViewController.swift
//  Blind_Security_Info
//  Created by Nick on 18/08/2017.
//  Copyright © 2017 Nick. All rights reserved.
//

import GoogleMaps
import UIKit
import CoreLocation

class FirstViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate {
    var locationManager: CLLocationManager = CLLocationManager()
//    var currLat: double = 0.0
//    var currLon: double = 0.0
    var newLocation: CLLocation = CLLocation()

    var headerView: UIView! = UIView()
    var addButton: UIButton! = UIButton()
    var titleLabel: UILabel! = UILabel()
    var addrLabel: UILabel! = UILabel()
    
    convenience init() {
        self.init(nibName: "FirstViewController", bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()

        setupView()

    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //        print(locations.count)
//        let newLocation: CLLocation = locations.last!
        newLocation = locations.last!
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
                self.addrLabel.text = lines.joined(separator: "\n")
            }
        }
    }

    func addButtonPressed() {
//        locationManager.stopUpdatingLocation()
//        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let nextViewController = storyboard.instantiateViewController(withIdentifier: "AddInfoViewController") as! AddInfoViewController
        let nextViewController = AddInfoViewController(nibName: "AddInfoViewController", bundle: nil)
        nextViewController.lat = round(10000*newLocation.coordinate.latitude)/10000
            nextViewController.lon = round(10000*newLocation.coordinate.longitude)/10000
        self.present(nextViewController, animated: false, completion: nil)
    }
    
    override func updateViewConstraints() {
        headerViewConstraints()
        addButtonConstraints()
        titleLabelConstraints()
        addrLabelConstraints()
        super.updateViewConstraints()
    }
    
    func headerViewConstraints() {
        //        headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        //        headerView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        //        headerView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        //        headerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        NSLayoutConstraint(
            item: headerView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: view,
            attribute: .centerX,
            multiplier: 1.0,
            constant: 0.0)
            .isActive = true
        
        NSLayoutConstraint(
            item: headerView,
            attribute: .width,
            relatedBy: .equal,
            toItem: view,
            attribute: .width,
            multiplier: 1.0,
            constant: 0.0
            )
            .isActive = true
        
        NSLayoutConstraint(
            item: headerView,
            attribute: .top,
            relatedBy: .equal,
            toItem: view,
            attribute: .top,
            multiplier: 1.0,
            constant: 0.0)
            .isActive = true
        NSLayoutConstraint(
            item: headerView,
            attribute: .height,
            relatedBy: .equal,            toItem: self.view,
            attribute: .height,
            multiplier: 0.2,
            constant: 0.0)
            .isActive = true
    }
    
    func titleLabelConstraints() {
        NSLayoutConstraint(
            item: titleLabel,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: headerView,
            attribute: .centerX,
            multiplier: 1.0,
            constant: 0.0)
            .isActive = true
        
        NSLayoutConstraint(
            item: titleLabel,
            attribute: .width,
            relatedBy: .equal,
            toItem: headerView,
            attribute: .width,
            multiplier: 0.6,
            constant: 0.0)
            .isActive = true
        
        NSLayoutConstraint(
            item: titleLabel,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: headerView,
            attribute: .centerY,
            multiplier: 1.0,
            constant: 0.0)
            .isActive = true
        
    }
    
    func addrLabelConstraints() {
        NSLayoutConstraint(
            item: addrLabel,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: view,
            attribute: .centerX,
            multiplier: 1.0,
            constant: 0.0)
            .isActive = true
        
        NSLayoutConstraint(
            item: addrLabel,
            attribute: .width,
            relatedBy: .equal,
            toItem: view,
            attribute: .width,
            multiplier: 1.0,
            constant: 0.0)
            .isActive = true
        
        NSLayoutConstraint(
            item: addrLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: view,
            attribute: .bottom,
            multiplier: 0.8,
            constant: 0.0)
            .isActive = true
        
    }

    func addButtonConstraints() {
        NSLayoutConstraint(
            item: addButton,
            attribute: .right,
            relatedBy: .equal,
            toItem: headerView,
            attribute: .right,
            multiplier: 1.0,
            constant: 0.0)
            .isActive = true
        
        NSLayoutConstraint(
            item: addButton,
            attribute: .width,
            relatedBy: .equal,
            toItem: headerView,
            attribute: .width,
            multiplier: 0.2,
            constant: 0.0)
            .isActive = true
        
        NSLayoutConstraint(
            item: addButton,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: headerView,
            attribute: .centerY,
            multiplier: 1.0,
            constant: 0.0)
            .isActive = true
        
    }
    
    func setupView() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.backgroundColor = UIColor.red
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.addTarget(self, action:#selector(addButtonPressed), for: .touchUpInside)
        addButton.setTitle("Add Info", for: .normal)
        addButton.backgroundColor = UIColor.blue
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Navigation"
        titleLabel.textAlignment = .center

        addrLabel.translatesAutoresizingMaskIntoConstraints = false
        //        addrLabel.text = "A"
        addrLabel.textAlignment = .center
        
        self.view.addSubview(headerView)
        self.view.addSubview(addrLabel)
        headerView.addSubview(addButton)
        headerView.addSubview(titleLabel)
        self.view.setNeedsUpdateConstraints()
    }
}
