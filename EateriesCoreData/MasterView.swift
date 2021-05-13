//
//  MasterView.swift
//  EateriesCoreData
//
//  Created by Tyler Harden on 13/5/21.
//

import SwiftUI

struct MasterView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var eateries: Eateries
    var body: some View {
        List {
            ForEach(eateries.restaurantArray) { restaurant in
                NavigationLink(
                    destination: DetailView(restaurant: restaurant),
                    label: {
                        RowView(restaurant: restaurant)
                    })
            }
            .onDelete { offsets in
                withAnimation { eateries.deleteItems(offsets: offsets) }
            }
        }.navigationBarItems(leading: EditButton(), trailing: Button(action: {
            withAnimation {
                eateries.addItem()
            }
        }) {
            Label("", systemImage: "plus")
        })
    }
}


//struct MasterView_Previews: PreviewProvider {
//    static var previews: some View {
//        MasterView(restaurants:restaurants)
//    }
//}
