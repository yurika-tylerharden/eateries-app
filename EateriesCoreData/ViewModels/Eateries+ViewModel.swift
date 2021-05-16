//
//  Eateries+ViewModel.swift
//  EateriesCoreData
//
//  Created by Tyler Harden on 13/5/21.
//

import Foundation
import CoreData

extension Eateries {
    var navigationTitleString: String {
        get { navigationTitle ?? "" }
        set { navigationTitle = newValue}
    }
    var restaurantArray: [Restaurant] {
        // ViewModel computed property that returns restaurants as array
        get { restaurant?.array as? [Restaurant] ?? []}
        set { restaurant = NSOrderedSet(array: newValue) }
    }
    var viewContext: NSManagedObjectContext {
        managedObjectContext ?? NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    }
    func addItem() {
        let newRestaurant = Restaurant(context: viewContext)
        newRestaurant.name = "New restaurant"
        newRestaurant.location = "Enter location"
        newRestaurant.notes = "Enter notes"
        addToRestaurant(newRestaurant)
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }

    func deleteItems(offsets: IndexSet) {
        offsets.map { restaurantArray[$0] }.forEach(viewContext.delete)

        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    func save() {
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
