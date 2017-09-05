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
    convenience init() {
        self.init(nibName: "SecondViewController1", bundle: nil)
    }

    override func viewDidLoad() {
        SecurityInfos.sharedinstance.addInfo(latitude: -24.1424, longitude: 12.1358, infoContent: "Be careful to a hole.")
        var infos = [SecurityInfo]()
            infos = SecurityInfos.sharedinstance.getAllInfo()
        print(infos)
    }
}
