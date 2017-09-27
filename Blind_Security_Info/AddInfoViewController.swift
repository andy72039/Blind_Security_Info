//
//  AddInfoViewController.swift
//
//
//  Created by Nick on 05/09/2017.
//
//

import UIKit

class AddInfoViewController: UIViewController, UITextFieldDelegate {
    var lat: Double = 0.0
    var lon: Double = 0.0
    var infoTitle: String = ""
    
    var headerView: UIView! = UIView()
    var titleTextField: UITextField! = UITextField()
    var contentTextField: UITextField! = UITextField()
    var saveButton: UIButton! = UIButton()
    var cancelButton: UIButton! = UIButton()
    var titleLabel: UILabel! = UILabel()

    convenience init() {
        self.init(nibName: "AddInfoViewController", bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        contentTextField.delegate = self
        titleTextField.delegate = self

        // Do any additional setup after loading the view.
        setupView()
//        print("\(lat), \(lon)")
    }
    
    func saveButtonPressed() {
        if !(contentTextField.text?.isEmpty)! {
            SecurityInfos.sharedinstance.addInfo(latitude: lat, longitude: lon, infoTitle: titleTextField.text!, infoContent: contentTextField.text!)
            dismiss(animated: false, completion: nil)
        }
    }
    
    func cancelButtonPressed() {
//        _ = navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    override func updateViewConstraints() {
        headerViewConstraints()
        titleTextFieldConstraints()
        contentTextFieldConstraints()
        saveButtonConstraints()
        cancelButtonConstraints()
        titleLabelConstraints()
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

    func titleTextFieldConstraints() {
        NSLayoutConstraint(
            item: titleTextField,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: self.view,
            attribute: .centerX,
            multiplier: 1.0,
            constant: 0.0)
            .isActive = true
        
        NSLayoutConstraint(
            item: titleTextField,
            attribute: .width,
            relatedBy: .equal,
            toItem: self.view,
            attribute: .width,
            multiplier: 0.8,
            constant: 0.0
            )
            .isActive = true
        
        NSLayoutConstraint(
            item: titleTextField,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: self.view,
            attribute: .centerY,
            multiplier: 0.8,
            constant: 0.0)
            .isActive = true
    }

    func contentTextFieldConstraints() {
        NSLayoutConstraint(
            item: contentTextField,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: self.view,
            attribute: .centerX,
            multiplier: 1.0,
            constant: 0.0)
            .isActive = true
        
        NSLayoutConstraint(
            item: contentTextField,
            attribute: .width,
            relatedBy: .equal,
            toItem: self.view,
            attribute: .width,
            multiplier: 0.8,
            constant: 0.0
            )
            .isActive = true
        
        NSLayoutConstraint(
            item: contentTextField,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: self.view,
            attribute: .centerY,
            multiplier: 1.2,
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
    
    func setupView() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.backgroundColor = UIColor.red

        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.borderStyle = .roundedRect
        titleTextField.textAlignment = .center
        titleTextField.text = infoTitle

        contentTextField.translatesAutoresizingMaskIntoConstraints = false
        contentTextField.borderStyle = .roundedRect
        contentTextField.textAlignment = .center

        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.addTarget(self, action:#selector(saveButtonPressed), for: .touchUpInside)
        saveButton.setTitle("Save Info", for: .normal)
        saveButton.backgroundColor = UIColor.blue

        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.addTarget(self, action:#selector(cancelButtonPressed), for: .touchUpInside)
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.backgroundColor = UIColor.blue
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Add Your Info"
        titleLabel.textAlignment = .center

        self.view.addSubview(headerView)
        self.view.addSubview(titleTextField)
        self.view.addSubview(contentTextField)
        headerView.addSubview(cancelButton)
        headerView.addSubview(saveButton)
        headerView.addSubview(titleLabel)
        self.view.setNeedsUpdateConstraints()
    }
}
