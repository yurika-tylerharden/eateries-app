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
//            ForEach(restaurants, id: \.self) { restaurant in
//                RestaurantCell(restaurant: restaurant)
            ForEach(0..<restaurants.count) { resturant in
                RestaurantCell(restaurant: restaurants[resturant])
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

//    //creates a new food with placeholder data
    private func onAdd() {
        restaurants.append(Restaurant(name: "New Restaurant", location: "Enter location", notes: "Enter notes", image: "placeholder", reviews: ["", ""]))
        EateriesApp.save()
    }
}

