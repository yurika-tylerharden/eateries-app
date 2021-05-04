//
//  RestaurantListView.swift
//  Eateries
//
//  Created by Tyler Harden on 4/5/21.
//

import SwiftUI

//List of foods in a view
struct RestaurantListView: View {
    @Binding var restaurants: [Restaurant]

    var body: some View {
        List {
            ForEach(restaurants) {
                RestaurantCell(restaurant: $restaurants[identifiedBy: $0])
//            Performs delete function
            }.onDelete {
                restaurants.remove(atOffsets: $0)
                EateriesApp.save()
//            Gives ability to move each cell
            }.onMove {
                restaurants.move(fromOffsets: $0, toOffset: $1)
                EateriesApp.save()
            }
            
        }
        //Adds an edit button and a plus icon that actions the add food function
        .navigationBarItems(leading: EditButton(), trailing:Button(action: onAdd) {
            Image(systemName: "plus")
        })
        .navigationBarTitle(Text("The Best Eateries"))
    }
//    deletes selected food
//    private func onDelete() {
//        foods.remove(atOffsets: $0)
////        FavouriteFoodApp.save()
//    }
//    //creates a new food with placeholder data
    private func onAdd() {
        restaurants.append(Restaurant(name: "New Restaurant", location: "Enter location", notes: "Enter notes", image: "placeholder", reviews: ["", ""]))
        EateriesApp.save()
    }
}

