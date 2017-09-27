//
//  ThirdViewController.swift
//  Blind_Security_Info
//
//  Created by Nick on 07/09/2017.
//  Copyright © 2017 Nick. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    var headerView: UIView! = UIView()
    var titleLabel: UILabel! = UILabel()
    var ttsSwitch: UISwitch! = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func switchChanged(sender: UISwitch!) {
        
    }
    
    override func updateViewConstraints() {
        headerViewConstraints()
        titleLabelConstraints()
        ttsSwitchConstraints()
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
    
    func ttsSwitchConstraints() {
        NSLayoutConstraint(
            item: ttsSwitch,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: self.view,
            attribute: .centerX,
            multiplier: 1.0,
            constant: 0.0)
            .isActive = true
        
        NSLayoutConstraint(
            item: ttsSwitch,
            attribute: .width,
            relatedBy: .equal,
            toItem: self.view,
            attribute: .width,
            multiplier: 1.0,
            constant: 0.0
            )
            .isActive = true
        
        NSLayoutConstraint(
            item: ttsSwitch,
            attribute: .top,
            relatedBy: .equal,
            toItem: headerView,
            attribute: .bottom,
            multiplier: 1.0,
            constant: 0.0)
            .isActive = true
    }

    func setupView() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.backgroundColor = UIColor.red
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Settings"
        titleLabel.textAlignment = .center
        

ttsSwitch.translatesAutoresizingMaskIntoConstraints = false
ttsSwitch.center = self.view.center
        ttsSwitch.setOn(false, animated: false)
        ttsSwitch.tintColor = UIColor.blue
        ttsSwitch.onTintColor = UIColor.cyan
        ttsSwitch.thumbTintColor = UIColor.red
    ttsSwitch.backgroundColor = UIColor.yellow
        ttsSwitch.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
        
        self.view.addSubview(headerView)
        self.view.addSubview(ttsSwitch)
        headerView.addSubview(titleLabel)

        self.view.setNeedsUpdateConstraints()
    }
}
