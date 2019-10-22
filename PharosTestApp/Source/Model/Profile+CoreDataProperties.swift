//
//  Profile+CoreDataProperties.swift
//  PharosTestApp
//
//  Created by Andriy Roshchin on 10/22/19.
//  Copyright © 2019 Andriy Roshchin. All rights reserved.
//
//

import Foundation
import CoreData


extension Profile {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Profile> {
        return NSFetchRequest<Profile>(entityName: "Profile")
    }

    @NSManaged public var email: String?
    @NSManaged public var id: String?
    @NSManaged public var lastName: String?
    @NSManaged public var name: String?
    @NSManaged public var photoURL: String?
    @NSManaged public var firstName: String?

}
