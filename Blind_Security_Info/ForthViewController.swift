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
    var voicePickerView: UIPickerView! = UIPickerView()
    var levelPickerView: UIPickerView! = UIPickerView()
    
    
    let infoLevel = ["low", "medium", "High"]
    let voice = ["On", "Off"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func switchChanged(sender: UISwitch!) {
        
    }
    
    override func updateViewConstraints() {
        headerViewConstraints()
        titleLabelConstraints()
        voicePickerViewConstraints()
        levelPickerViewConstraints()
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
    
    func voicePickerViewConstraints() {
        NSLayoutConstraint(
            item: voicePickerView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: self.view,
            attribute: .centerX,
            multiplier: 1.0,
            constant: 0.0)
            .isActive = true
        
        NSLayoutConstraint(
            item: voicePickerView,
            attribute: .width,
            relatedBy: .equal,
            toItem: self.view,
            attribute: .width,
            multiplier: 0.5,
            constant: 0.0
            )
            .isActive = true
        
        NSLayoutConstraint(
            item: voicePickerView,
            attribute: .top,
            relatedBy: .equal,
            toItem: headerView,
            attribute: .bottom,
            multiplier: 1.0,
            constant: 2.0)
            .isActive = true
    }

    func levelPickerViewConstraints() {
        NSLayoutConstraint(
            item: levelPickerView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: self.view,
            attribute: .centerX,
            multiplier: 1.0,
            constant: 0.0)
            .isActive = true
        
        NSLayoutConstraint(
            item: levelPickerView,
            attribute: .width,
            relatedBy: .equal,
            toItem: self.view,
            attribute: .width,
            multiplier: 0.5,
            constant: 0.0
            )
            .isActive = true
        
        NSLayoutConstraint(
            item: levelPickerView,
            attribute: .top,
            relatedBy: .equal,
            toItem: voicePickerView,
            attribute: .bottom,
            multiplier: 1.0,
            constant: 2.0)
            .isActive = true
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return voice.count
        } else {
            return infoLevel.count
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return voice[row]
        } else {
            return infoLevel[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            if row == 0 {
                print("pickerview changed)")
//                FirstViewController.sharedInstance.setVoice(voiceOn: true)
                FirstViewController.sharedInstance.voiceOn = true
            } else {
//                FirstViewController.sharedInstance.setVoice(voiceOn: false)
                FirstViewController.sharedInstance.voiceOn = false
            }
        }
    }

    func setupView() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.backgroundColor = UIColor.red
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Settings"
        titleLabel.textAlignment = .center

        voicePickerView.delegate = self
        voicePickerView.dataSource = self
        voicePickerView.translatesAutoresizingMaskIntoConstraints = false
        voicePickerView.tag = 1

        levelPickerView.delegate = self
        levelPickerView.dataSource = self
        levelPickerView.translatesAutoresizingMaskIntoConstraints = false
        levelPickerView.tag = 2

        self.view.addSubview(headerView)
        self.view.addSubview(voicePickerView)
        self.view.addSubview(levelPickerView)
        headerView.addSubview(titleLabel)
        
        self.view.setNeedsUpdateConstraints()
    }
}
