//
//  Review+CoreDataProperties.swift
//  EateriesCoreData
//
//  Created by Tyler Harden on 13/5/21.
//
//

import Foundation
import CoreData


extension Review {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Review> {
        return NSFetchRequest<Review>(entityName: "Review")
    }

    @NSManaged public var reviewer: String?
    @NSManaged public var comment: String?
    @NSManaged public var restaurant: Restaurant?

}

extension Review : Identifiable {

}
