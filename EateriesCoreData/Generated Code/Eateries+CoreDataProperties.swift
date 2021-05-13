//
//  Eateries+CoreDataProperties.swift
//  EateriesCoreData
//
//  Created by Tyler Harden on 13/5/21.
//
//

import Foundation
import CoreData


extension Eateries {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Eateries> {
        return NSFetchRequest<Eateries>(entityName: "Eateries")
    }

    @NSManaged public var navigationTitle: String?
    @NSManaged public var restaurant: NSOrderedSet?

}

// MARK: Generated accessors for restaurant
extension Eateries {

    @objc(insertObject:inRestaurantAtIndex:)
    @NSManaged public func insertIntoRestaurant(_ value: Restaurant, at idx: Int)

    @objc(removeObjectFromRestaurantAtIndex:)
    @NSManaged public func removeFromRestaurant(at idx: Int)

    @objc(insertRestaurant:atIndexes:)
    @NSManaged public func insertIntoRestaurant(_ values: [Restaurant], at indexes: NSIndexSet)

    @objc(removeRestaurantAtIndexes:)
    @NSManaged public func removeFromRestaurant(at indexes: NSIndexSet)

    @objc(replaceObjectInRestaurantAtIndex:withObject:)
    @NSManaged public func replaceRestaurant(at idx: Int, with value: Restaurant)

    @objc(replaceRestaurantAtIndexes:withRestaurant:)
    @NSManaged public func replaceRestaurant(at indexes: NSIndexSet, with values: [Restaurant])

    @objc(addRestaurantObject:)
    @NSManaged public func addToRestaurant(_ value: Restaurant)

    @objc(removeRestaurantObject:)
    @NSManaged public func removeFromRestaurant(_ value: Restaurant)

    @objc(addRestaurant:)
    @NSManaged public func addToRestaurant(_ values: NSOrderedSet)

    @objc(removeRestaurant:)
    @NSManaged public func removeFromRestaurant(_ values: NSOrderedSet)

}

extension Eateries : Identifiable {

}
