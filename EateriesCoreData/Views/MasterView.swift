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
        VStack {
            List {
                ForEach(eateries.restaurantArray) { restaurant in
                    NavigationLink(
                        destination: RouterView(restaurant: restaurant),
                        label: {
                            RowView(restaurant: restaurant)
                        })
                }
                .onDelete { offsets in
                    withAnimation { eateries.deleteItems(offsets: offsets) }
                }
                .onMove {
                    eateries.restaurantArray.move(fromOffsets: $0, toOffset: $1)
                    eateries.save()
                }
            }.navigationBarItems(leading: EditButton(), trailing: Button(action: {
                withAnimation { eateries.addItem() }
            }) { Label("", systemImage: "plus")
            })
            .navigationBarTitle(Text("The Best Eateries"))
            .listStyle(InsetGroupedListStyle())
        }
    }
}


//struct MasterView_Previews: PreviewProvider {
//    static var previews: some View {
//        MasterView(restaurants:restaurants)
//    }
//}
