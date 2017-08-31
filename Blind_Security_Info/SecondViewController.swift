//
//  SecondViewController.swift
//  Blind_Security_Info
//
//  Created by Nick on 18/08/2017.
//  Copyright © 2017 Nick. All rights reserved.
//

import UIKit
import CoreData

class SecondViewController: UIViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext

    override func viewDidLoad() {
        addInfo(latitude: 24.1424, longitude: 112.1358, infoContent: "Be careful to the tree.")
    }

    func addInfo(latitude:Double, longitude:Double, infoContent:String) {
       let si = SecurityInfo(context:context)

        si.latitude = latitude
        si.longitude = longitude
        si.infoContent = infoContent
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        print("Save successful!")
    }
}
