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
    @NSManaged public var restaurant: NSSet?

}

// MARK: Generated accessors for restaurant
extension Eateries {

    @objc(addRestaurantObject:)
    @NSManaged public func addToRestaurant(_ value: Restaurant)

    @objc(removeRestaurantObject:)
    @NSManaged public func removeFromRestaurant(_ value: Restaurant)

    @objc(addRestaurant:)
    @NSManaged public func addToRestaurant(_ values: NSSet)

    @objc(removeRestaurant:)
    @NSManaged public func removeFromRestaurant(_ values: NSSet)

}

extension Eateries : Identifiable {

}
