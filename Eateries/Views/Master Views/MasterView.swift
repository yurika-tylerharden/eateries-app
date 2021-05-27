//
//  RestaurantListView.swift
//  Eateries
//
//  Created by Tyler Harden on 4/5/21.
//

import SwiftUI

//List of foods in a view
struct MasterView: View {
    @ObservedObject var eateries: Eateries
    @Environment(\.editMode) var mode
    
    var body: some View {
        VStack {
            List {
                ForEach(eateries.restaurant) { restaurant in
                    NavigationLink(
                        destination: RouterView(restaurant: restaurant),
                        label: {
                            RowView(restaurant: restaurant)
                        }
                    )
                }
                .onDelete { offsets in
                    withAnimation { eateries.restaurant.remove(atOffsets: offsets) }
                }
                .onMove {
                    eateries.restaurant.move(fromOffsets: $0, toOffset: $1)
                    eateries.save()
                }
            }.navigationBarItems(leading: EditButton(), trailing: Button(action: {
                withAnimation { eateries.addItem() } }) { Label("", systemImage: "plus")
            })
            .listStyle(InsetGroupedListStyle())
        }.navigationBarTitle(self.mode?.wrappedValue == .active ? Text("") : Text(eateries.navigationTitleString) )
    }
}
