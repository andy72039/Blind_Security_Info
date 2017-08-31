//
//  SecurityInfo+CoreDataProperties.swift
//  Blind_Security_Info
//
//  Created by Nick on 31/08/2017.
//  Copyright © 2017 Nick. All rights reserved.
//

import Foundation
import CoreData


extension SecurityInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SecurityInfo> {
        return NSFetchRequest<SecurityInfo>(entityName: "SecurityInfo")
    }

    @NSManaged public var infoContent: String?
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double

}
