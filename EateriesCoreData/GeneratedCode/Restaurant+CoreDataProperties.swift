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
    @NSManaged public var review: NSOrderedSet?
    @NSManaged public var eateries: Eateries?

}

// MARK: Generated accessors for review
extension Restaurant {

    @objc(insertObject:inReviewAtIndex:)
    @NSManaged public func insertIntoReview(_ value: Review, at idx: Int)

    @objc(removeObjectFromReviewAtIndex:)
    @NSManaged public func removeFromReview(at idx: Int)

    @objc(insertReview:atIndexes:)
    @NSManaged public func insertIntoReview(_ values: [Review], at indexes: NSIndexSet)

    @objc(removeReviewAtIndexes:)
    @NSManaged public func removeFromReview(at indexes: NSIndexSet)

    @objc(replaceObjectInReviewAtIndex:withObject:)
    @NSManaged public func replaceReview(at idx: Int, with value: Review)

    @objc(replaceReviewAtIndexes:withReview:)
    @NSManaged public func replaceReview(at indexes: NSIndexSet, with values: [Review])

    @objc(addReviewObject:)
    @NSManaged public func addToReview(_ value: Review)

    @objc(removeReviewObject:)
    @NSManaged public func removeFromReview(_ value: Review)

    @objc(addReview:)
    @NSManaged public func addToReview(_ values: NSOrderedSet)

    @objc(removeReview:)
    @NSManaged public func removeFromReview(_ values: NSOrderedSet)

}

extension Restaurant : Identifiable {

}
