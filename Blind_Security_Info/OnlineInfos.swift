//
//  OnlineInfos.swift
//  
//
//  Created by Nick on 16/10/2017.
//
//

import Foundation
import CoreData

class OnlineInfos {
    static let sharedInstance = OnlineInfos()
    let context = (UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
    var infos = [OnlineInfo]()
    
    func addInfo(latitude:Double, longitude:Double, infoTitle:String, infoContent:String, securityLevel: Int) {
        let si = OnlineInfo(context:context)
        
        si.latitude = latitude
        si.longitude = longitude
        si.infoTitle = infoTitle
        si.infoContent = infoContent
        si.securityLevel = Int64(securityLevel)
        
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        print("Save successful!")
    }
    
    func getAllInfo() -> [OnlineInfo] {
        do {
            infos =  try context.fetch(OnlineInfo.fetchRequest())
        } catch {
            print("Error fetching datafrom CoreData")
        }
        
        return infos
    }
    
    func editInfo(infoID: NSManagedObjectID, infoTitle: String, infoContent: String, securityLevel: Int) {
        do {
            infos =  try context.fetch(SecurityInfo.fetchRequest())
            
            for info in infos {
                if info.objectID == infoID {
                    info.infoTitle = infoTitle
                    info.infoContent = infoContent
                    info.securityLevel = Int64(securityLevel)
                }
            }
        } catch {
            print("Error fetching datafrom CoreData")
        }
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
    }
    
    func deleteInfo(infoID: NSManagedObjectID) {
        do {
            infos =  try context.fetch(OnlineInfo.fetchRequest())
            for info in infos {
                if info.objectID == infoID {
                    context.delete(info)
                }
            }
        } catch {
            print("Error fetching datafrom CoreData")
        }
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
}
