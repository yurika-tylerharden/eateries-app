//
//  Restaurant+CoreDataProperties.swift
//  EateriesCoreData
//
//  Created by Tyler Harden on 13/5/21.
//
//

import Foundation
import CoreData


extension Restaurant {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Restaurant> {
        return NSFetchRequest<Restaurant>(entityName: "Restaurant")
    }

    @NSManaged public var name: String?
    @NSManaged public var location: String?
    @NSManaged public var notes: String?
    @NSManaged public var image: String?
    @NSManaged public var review: NSSet?
    @NSManaged public var eateries: Eateries?

}

// MARK: Generated accessors for review
extension Restaurant {

    @objc(addReviewObject:)
    @NSManaged public func addToReview(_ value: Review)

    @objc(removeReviewObject:)
    @NSManaged public func removeFromReview(_ value: Review)

    @objc(addReview:)
    @NSManaged public func addToReview(_ values: NSSet)

    @objc(removeReview:)
    @NSManaged public func removeFromReview(_ values: NSSet)

}

extension Restaurant : Identifiable {

}
