//
//  OnlineInfo+CoreDataProperties.swift
//  
//
//  Created by Nick on 16/10/2017.
//
//

import Foundation
import CoreData


extension OnlineInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<OnlineInfo> {
        return NSFetchRequest<OnlineInfo>(entityName: "OnlineInfo")
    }

    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var infoTitle: String?
    @NSManaged public var infoContent: String?
    @NSManaged public var securityContent: Int64

}
