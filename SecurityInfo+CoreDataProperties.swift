//
//  SecurityInfo+CoreDataProperties.swift
//  
//
//  Created by Nick on 07/09/2017.
//
//

import Foundation
import CoreData


extension SecurityInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SecurityInfo> {
        return NSFetchRequest<SecurityInfo>(entityName: "SecurityInfo")
    }

    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var infoContent: String?

}
