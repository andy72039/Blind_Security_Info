//
//  AddInfoViewController.swift
//  Blind_Security_Info
//
//  Created by Nick on 31/08/2017.
//  Copyright © 2017 Nick. All rights reserved.
//

import UIKit

class AddInfoViewController: UIViewController, UITextViewDelegate {

    var lat: Double = 0.0
    var lon: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        
        // Do any additional setup after loading the view.
        view.addSubview(textField)
        view.addSubview(cancelButton)
        view.addSubview(saveButton)
//        view.addSubview(label)
        view.setNeedsUpdateConstraints()
    }
    
    func saveButtonPressed() {
//        label.text = "Hello, \(textField.text!)"
    }
    
    func cancelButtonPressed() {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    override func updateViewConstraints() {
        textFieldConstraints()
        saveButtonConstraints()
        cancelButtonConstraints()
        labelConstraints()
        
        super.updateViewConstraints()
    }
    
    func textFieldConstraints() {
        NSLayoutConstraint(
            item: textField,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: view,
            attribute: .centerX,
            multiplier: 1.0,
            constant: 0.0)
            .isActive = true
        
        NSLayoutConstraint(
            item: textField,
            attribute: .width,
            relatedBy: .equal,
            toItem: view,
            attribute: .width,
            multiplier: 0.8,
            constant: 0.0
            )
            .isActive = true
        
        NSLayoutConstraint(
            item: textField,
            attribute: .top,
            relatedBy: .equal,
            toItem: view,
            attribute: .bottom,
            multiplier: 0.1,
            constant: 0.0)
            .isActive = true
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
            multiplier: 1.0,
            constant: 0.0)
            .isActive = true
        
    }
    
    func saveButtonConstraints() {
        NSLayoutConstraint(
            item: saveButton,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: view,
            attribute: .centerX,
            multiplier: 2.0,
            constant: 0.0)
            .isActive = true
        
        NSLayoutConstraint(
            item: saveButton,
            attribute: .width,
            relatedBy: .equal,
            toItem: view,
            attribute: .width,
            multiplier: 0.3,
            constant: 0.0)
            .isActive = true
        
        NSLayoutConstraint(
            item: saveButton,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: view,
            attribute: .bottom,
            multiplier: 0.1,
            constant: 0.0)
            .isActive = true
        
    }

    func CancelButtonConstraints() {
        NSLayoutConstraint(
            item: cancelButton,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: view,
            attribute: .centerX,
            multiplier: 0.0,
            constant: 0.0)
            .isActive = true
        
        NSLayoutConstraint(
            item: cancelButton,
            attribute: .width,
            relatedBy: .equal,
            toItem: view,
            attribute: .width,
            multiplier: 0.3,
            constant: 0.0)
            .isActive = true
        
        NSLayoutConstraint(
            item: cancelButton,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: view,
            attribute: .bottom,
            multiplier: 0.1,
            constant: 0.0)
            .isActive = true
        
    }

    lazy var textField: UITextField! = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.borderStyle = .roundedRect
        view.textAlignment = .center
        
        return view
    }()
    
    lazy var saveButton: UIButton! =  {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action:#selector(saveButtonPressed), for: .touchUpInside)
        
        view.setTitle("Save Info", for: .normal)
        view.backgroundColor = UIColor.blue
        return view
    }()
    
    lazy var cancelButton: UIButton! =  {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action:#selector(cancelButtonPressed), for: .touchUpInside)
        
        view.setTitle("Cancel", for: .normal)
        view.backgroundColor = UIColor.blue
        return view
    }()
 
    lazy var label: UILabel! = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Hello world!"
        view.textAlignment = .center
        
        return view
    }()
}
