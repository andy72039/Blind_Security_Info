//
//  SecurityInfos.swift
//  Blind_Security_Info
//
//  Created by Nick on 05/09/2017.
//  Copyright © 2017 Nick. All rights reserved.
//

import UIKit
import Foundation

class SecurityInfos {
    static let sharedinstance = SecurityInfos()
    let context = (UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
    var infos = [SecurityInfo]()
    
    func addInfo(latitude:Double, longitude:Double, infoContent:String) {
        let si = SecurityInfo(context:context)
        
        si.latitude = latitude
        si.longitude = longitude
        si.infoContent = infoContent
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        print("Save successful!")
    }
    
    func getAllInfo() -> [SecurityInfo] {
        do {
            infos =  try context.fetch(SecurityInfo.fetchRequest())
        } catch {
            print("Error fetching datafrom CoreData")
        }
        
        return infos
    }
}
