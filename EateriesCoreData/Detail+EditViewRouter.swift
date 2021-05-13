//
//  Detail+EditViewRouter.swift
//  EateriesCoreData
//
//  Created by Tyler Harden on 13/5/21.
//

import SwiftUI

struct RouterView: View {
    @ObservedObject var restaurant: Restaurant
    @Environment(\.editMode) var mode
    
    var body: some View {
        //if in edit move go to edit page
        NavigationView {
            if mode?.wrappedValue == .inactive {
                DetailView(restaurant: restaurant)
                    .animation(.easeInOut)
            }
            //if not, go to detail page
            else {
                EditView(restaurant: restaurant)
                    .transition(.move(edge: .bottom))
            }
        }.navigationViewStyle(StackNavigationViewStyle())
        .navigationBarItems(trailing: EditButton())
    }

}

