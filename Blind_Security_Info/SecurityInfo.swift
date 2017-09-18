//
//  SecurityInfos.swift
//  Blind_Security_Info
//
//  Created by Nick on 05/09/2017.
//  Copyright © 2017 Nick. All rights reserved.
//

import UIKit
import Foundation
import CoreData

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

    func deleteInfo(infoID: NSManagedObjectID) {
        do {
            infos =  try context.fetch(SecurityInfo.fetchRequest())
            for info in infos {
                if info.objectID == infoID {
                    context.delete(info)
                    print("delete success")
                    //                print(infos.count)
                }
            }
        } catch {
            print("Error fetching datafrom CoreData")
        }
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }

}
