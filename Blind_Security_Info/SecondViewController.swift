//
//  SecondViewController.swift
//  Blind_Security_Info
//
//  Created by Nick on 18/08/2017.
//  Copyright © 2017 Nick. All rights reserved.
//

import UIKit
import CoreData

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var headerView: UIView! = UIView()
    var titleLabel: UILabel! = UILabel()
    var myTableView: UITableView!

    var infos = [SecurityInfo]()
    var infoArray: NSMutableArray! = NSMutableArray()
    var IDArray: NSMutableArray! = NSMutableArray()
    let sections = [""]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

//        print("2nd ViewController")
//        SecurityInfos.sharedinstance.addInfo(latitude: -24.1424, longitude: 12.1358, infoContent: "Be careful to a hole.")
        infos = SecurityInfos.sharedinstance.getAllInfo()
//        print(infos)
//        print(infos[infos.count-1].infoContent)

        for si in infos {
            infoArray.add(from: si.infoContent)
            IDArray.add(si.objectID)
        }
//        print(tableArray)
//        print(tableArray[tableArray.count-1])

    }
    
    override func updateViewConstraints() {
        headerViewConstraints()
        titleLabelConstraints()
        myTableViewConstraints()
        super.updateViewConstraints()
    }
    
    func headerViewConstraints() {
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
            relatedBy: .equal,
            toItem: view,
            attribute: .height,
            multiplier: 0.2,
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
            toItem: self.view,
            attribute: .bottom,
            multiplier: 1.0,
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextViewController = EditInfoViewController(nibName: "EditInfoViewController", bundle: nil)
        nextViewController.infoText = infos[indexPath.row].infoContent!
        nextViewController.infoID = infos[indexPath.row].objectID
        self.present(nextViewController, animated: false, completion: nil)
    }

    func setupView() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.backgroundColor = UIColor.red
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "My All Info"
        titleLabel.textAlignment = .center
        
        myTableView = UITableView()
        myTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")         // register cell name
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.rowHeight = UITableViewAutomaticDimension
        myTableView.estimatedRowHeight = 44
        myTableView.allowsSelection = true

        self.view.addSubview(headerView)
        self.view.addSubview(myTableView)
        headerView.addSubview(titleLabel)
        self.view.setNeedsUpdateConstraints()
    }
}
