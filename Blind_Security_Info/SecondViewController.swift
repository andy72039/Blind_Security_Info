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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("2nd ViewController")
//        SecurityInfos.sharedinstance.addInfo(latitude: -24.1424, longitude: 12.1358, infoContent: "Be careful to a hole.")
        var infos = [SecurityInfo]()
        infos = SecurityInfos.sharedinstance.getAllInfo()
//        print(infos)
        print(infos.count)
    }
}
