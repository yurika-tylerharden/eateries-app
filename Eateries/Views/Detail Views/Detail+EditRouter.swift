//
//  DetailRoute.swift
//  Eateries
//
//  Created by Tyler Harden on 4/5/21.
//

import SwiftUI

//Structure defining the detail view for selected food. If in edit mode it will route user to edit page
struct RouterView: View {
    @ObservedObject var restaurant: Restaurant
    @Environment(\.editMode) var mode
    
    var body: some View {
        //if in edit move go to edit page
        List {
            if mode?.wrappedValue == .inactive {
                DetailView(restaurant: restaurant)
                    .animation(.easeInOut)
            }
            //if not, go to detail page
            else {
                EditView(restaurant: restaurant)
                    .transition(.move(edge: .bottom))
                    .onDisappear {
                        restaurant.save()
                    }
            }
        }
        .navigationBarItems(trailing: EditButton())
    }
}

