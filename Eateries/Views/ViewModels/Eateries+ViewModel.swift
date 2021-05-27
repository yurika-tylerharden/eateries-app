//
//  Eateries+ViewModel.swift
//  Eateries
//
//  Created by Tyler Harden on 27/5/21.
//

import Foundation


extension Eateries {
//    var navigationTitleString: String {
//        get { navigationTitle ?? "" }
//        set { navigationTitle = newValue}
//    }
//    var restaurantArray: [Restaurant] {
//        // ViewModel computed property that returns restaurants as array
//        get { restaurant }
//        set { restaurant(array: newValue) }
//    }

    func addItem() {
        let newRestaurant = Restaurant(name: "New Restaurant", location: "Enter location", notes: "Enter notes", image: "Enter image", review: [Review(reviewer: "Enter name", comment: "Enter review")])
        restaurant.append(newRestaurant)
        EateriesApp.save()
    }

    func deleteItems(offsets: IndexSet) {
        restaurant.remove(atOffsets: offsets)
        save()
    }
    func save() {
        EateriesApp.save()
    }
}
