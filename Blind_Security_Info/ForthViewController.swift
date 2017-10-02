//
//  ForthViewController.swift
//  Blind_Security_Info
//
//  Created by Nick on 01/10/2017.
//  Copyright © 2017 Nick. All rights reserved.
//

import UIKit

class ForthViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var headerView: UIView! = UIView()
    var titleLabel: UILabel! = UILabel()
    var myPickerView: UIPickerView! = UIPickerView()
    
    let infoLevel = ["low", "medium", "High"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func switchChanged(sender: UISwitch!) {
        
    }
    
    override func updateViewConstraints() {
        headerViewConstraints()
        titleLabelConstraints()
        myPickerViewConstraints()
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
    
    func myPickerViewConstraints() {
        NSLayoutConstraint(
            item: myPickerView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: self.view,
            attribute: .centerX,
            multiplier: 1.0,
            constant: 0.0)
            .isActive = true
        
        NSLayoutConstraint(
            item: myPickerView,
            attribute: .width,
            relatedBy: .equal,
            toItem: self.view,
            attribute: .width,
            multiplier: 1.0,
            constant: 0.0
            )
            .isActive = true
        
        NSLayoutConstraint(
            item: myPickerView,
            attribute: .top,
            relatedBy: .equal,
            toItem: headerView,
            attribute: .bottom,
            multiplier: 1.0,
            constant: 0.0)
            .isActive = true
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return infoLevel.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return infoLevel[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    }

    
    func setupView() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.backgroundColor = UIColor.red
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Settings"
        titleLabel.textAlignment = .center
        
myPickerView.delegate = self
        myPickerView.dataSource = self
        myPickerView.translatesAutoresizingMaskIntoConstraints = false
        

        
        self.view.addSubview(headerView)
        self.view.addSubview(myPickerView)
        headerView.addSubview(titleLabel)
        
        self.view.setNeedsUpdateConstraints()
    }
}
