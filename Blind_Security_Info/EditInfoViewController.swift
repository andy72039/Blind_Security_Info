//
//  EditInfoViewController.swift
//  Blind_Security_Info
//
//  Created by Nick on 16/09/2017.
//  Copyright © 2017 Nick. All rights reserved.
//

import UIKit
import CoreData

class EditInfoViewController: UIViewController, UITextFieldDelegate {
    var lat: Double = 0.0
    var lon: Double = 0.0
    var infoID: NSManagedObjectID = NSManagedObjectID()
    var infoText: String = ""
    
    var headerView: UIView! = UIView()
    var textField: UITextField! = UITextField()
    var saveButton: UIButton! = UIButton()
    var cancelButton: UIButton! = UIButton()
    var titleLabel: UILabel! = UILabel()
    var deleteButton: UIButton! = UIButton()
    
    convenience init() {
        self.init(nibName: "EditInfoViewController", bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        
        // Do any additional setup after loading the view.
        setupView()
        //        print("\(lat), \(lon)")
    }
    
    func saveButtonPressed() {
//        if !(textField.text?.isEmpty)! {
//            SecurityInfos.sharedinstance.addInfo(latitude: lat, longitude: lon, infoContent: textField.text!)
//            dismiss(animated: false, completion: nil)
//        }
    }
    
    func cancelButtonPressed() {
        //        _ = navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    func deleteButtonPressed() {
        SecurityInfos.sharedinstance.deleteInfo(infoID: infoID)
//        SecondViewController.sharedInstance.getInfoData()
//        SecondViewController.sharedInstance.myTableView.reloadData()
        dismiss(animated: false, completion: nil)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    override func updateViewConstraints() {
        headerViewConstraints()
        textFieldConstraints()
        saveButtonConstraints()
        cancelButtonConstraints()
        titleLabelConstraints()
        deleteButtonConstraints()
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
    
    func textFieldConstraints() {
        NSLayoutConstraint(
            item: textField,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: self.view,
            attribute: .centerX,
            multiplier: 1.0,
            constant: 0.0)
            .isActive = true
        
        NSLayoutConstraint(
            item: textField,
            attribute: .width,
            relatedBy: .equal,
            toItem: self.view,
            attribute: .width,
            multiplier: 0.8,
            constant: 0.0
            )
            .isActive = true
        
        NSLayoutConstraint(
            item: textField,
            attribute: .top,
            relatedBy: .equal,
            toItem: self.view,
            attribute: .bottom,
            multiplier: 0.4,
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
    
    func saveButtonConstraints() {
        NSLayoutConstraint(
            item: saveButton,
            attribute: .right,
            relatedBy: .equal,
            toItem: headerView,
            attribute: .right,
            multiplier: 1.0,
            constant: 0.0)
            .isActive = true
        
        NSLayoutConstraint(
            item: saveButton,
            attribute: .width,
            relatedBy: .equal,
            toItem: headerView,
            attribute: .width,
            multiplier: 0.2,
            constant: 0.0)
            .isActive = true
        
        NSLayoutConstraint(
            item: saveButton,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: headerView,
            attribute: .centerY,
            multiplier: 1.0,
            constant: 0.0)
            .isActive = true
        
    }
    
    func cancelButtonConstraints() {
        NSLayoutConstraint(
            item: cancelButton,
            attribute: .left,
            relatedBy: .equal,
            toItem: headerView,
            attribute: .left,
            multiplier: 1.0,
            constant: 0.0)
            .isActive = true
        
        NSLayoutConstraint(
            item: cancelButton,
            attribute: .width,
            relatedBy: .equal,
            toItem: headerView,
            attribute: .width,
            multiplier: 0.2,
            constant: 0.0)
            .isActive = true
        
        NSLayoutConstraint(
            item: cancelButton,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: headerView,
            attribute: .centerY,
            multiplier: 1.0,
            constant: 0.0)
            .isActive = true
    }
    func deleteButtonConstraints() {
        NSLayoutConstraint(
            item: deleteButton,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: self.view,
            attribute: .centerX,
            multiplier: 1.0,
            constant: 0.0)
            .isActive = true
        
        NSLayoutConstraint(
            item: deleteButton,
            attribute: .width,
            relatedBy: .equal,
            toItem: self.view,
            attribute: .width,
            multiplier: 0.8,
            constant: 0.0
            )
            .isActive = true
        
        NSLayoutConstraint(
            item: deleteButton,
            attribute: .top,
            relatedBy: .equal,
            toItem: self.view,
            attribute: .bottom,
            multiplier: 0.8,
            constant: 0.0)
            .isActive = true
    }

    func setupView() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.backgroundColor = UIColor.red
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        textField.text = infoText
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.addTarget(self, action:#selector(saveButtonPressed), for: .touchUpInside)
        saveButton.setTitle("Save Info", for: .normal)
        saveButton.backgroundColor = UIColor.blue
        
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.addTarget(self, action:#selector(cancelButtonPressed), for: .touchUpInside)
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.backgroundColor = UIColor.blue
        
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.addTarget(self, action:#selector(deleteButtonPressed), for: .touchUpInside)
        deleteButton.setTitle("Delete This Info", for: .normal)
        deleteButton.backgroundColor = UIColor.blue

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Edit Your Info"
        titleLabel.textAlignment = .center

        self.view.addSubview(headerView)
        self.view.addSubview(textField)
            self.view.addSubview(deleteButton)
        headerView.addSubview(cancelButton)
        headerView.addSubview(saveButton)
        headerView.addSubview(titleLabel)
        self.view.setNeedsUpdateConstraints()
    }
}
