//  FirstViewController.swift
//  Blind_Security_Info
//  Created by Nick on 18/08/2017.
//  Copyright © 2017 Nick. All rights reserved.
//

import GoogleMaps
import UIKit
import CoreLocation
import CoreData
import AVFoundation

class FirstViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate, UITableViewDelegate, UITableViewDataSource {
    var locationManager: CLLocationManager = CLLocationManager()
//    var currLat: double = 0.0
//    var currLon: double = 0.0
    var newLocation: CLLocation = CLLocation()

    var headerView: UIView! = UIView()
    var addButton: UIButton! = UIButton()
    var titleLabel: UILabel! = UILabel()
    var addrLabel: UILabel! = UILabel()
    
    var myTableView: UITableView! = UITableView()
    
    var infos = [SecurityInfo]()
    var infoArray: NSMutableArray! = NSMutableArray()
    var IDArray: NSMutableArray!
    let sections = [""]

    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string: "")
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        locationManager.startUpdatingLocation()
        infos = SecurityInfos.sharedinstance.getAllInfo()
    }
    override func viewWillDisappear(_ animated: Bool) {
        locationManager.stopUpdatingLocation()
    }
    

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //        print(locations.count)
//        let newLocation: CLLocation = locations.last!
        newLocation = locations.last!
        reverseGeocodeCoordinate(coordinate: newLocation.coordinate)
        checkInfoArround(coordinate: newLocation.coordinate)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
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
        myTableViewConstraints()
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
            attribute: .bottom,
            relatedBy: .equal,
            toItem: self.view,
            attribute: .bottom,
            multiplier: 0.9,
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
    func myTableViewConstraints() {
        NSLayoutConstraint(
            item: myTableView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: self.view,
            attribute: .centerX,
            multiplier: 1.0,
            constant: 0.0)
            .isActive = true
        
        NSLayoutConstraint(
            item: myTableView,
            attribute: .width,
            relatedBy: .equal,
            toItem: self.view,
            attribute: .width,
            multiplier: 1.0,
            constant: 0.0
            )
            .isActive = true
        
        NSLayoutConstraint(
            item: myTableView,
            attribute: .top,
            relatedBy: .equal,
            toItem: headerView,
            attribute: .bottom,
            multiplier: 1.0,
            constant: 0.0)
            .isActive = true
        NSLayoutConstraint(
            item: myTableView,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: addrLabel,
            attribute: .top,
            multiplier: 1.0,
            constant: 0.0)
            .isActive = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoArray.count
    }
    
    // return cells
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        if indexPath.section == 0 {
            cell.labelOne.text = "\(infoArray[indexPath.row])"
            //            cell.labelTwo.text = "Message \(indexPath.row)"
            //            cell.labelThree.text = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: .short, timeStyle: .short)
        }
        return cell
    }
    
    // Session
    //
    //
    
    // return the number of sections
    func numberOfSections(in tableView: UITableView) -> Int{
        return sections.count
    }
    
    // return the title of sections
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section] as? String
    }
    
    func checkInfoArround(coordinate: CLLocationCoordinate2D) {
        let lat:Double = round(10000*coordinate.latitude)/10000
        let long:Double = round(10000*coordinate.longitude)/10000
        infoArray.removeAllObjects()
        IDArray = NSMutableArray()
        for si in infos {
            if lat == si.latitude && long == si.longitude {
                infoArray.add(from: si.infoContent)
            }
        }
        if infoArray.count != 0 {
            myUtterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
            myUtterance.rate = 0.4
            for info in infoArray {
                myUtterance = AVSpeechUtterance(string: String(describing: info))
                synth.speak(myUtterance)
                
            }
        }
        myTableView.reloadData()
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

        myTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")         // register cell name
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.rowHeight = UITableViewAutomaticDimension
        myTableView.estimatedRowHeight = 44
        myTableView.allowsSelection = false

        self.view.addSubview(headerView)
        self.view.addSubview(addrLabel)
        self.view.addSubview(myTableView)
        headerView.addSubview(addButton)
        headerView.addSubview(titleLabel)
        self.view.setNeedsUpdateConstraints()
    }
}
