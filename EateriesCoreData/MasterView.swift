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
                Text(restaurant.nameString)
            }
            .onDelete(perform: eateries.deleteItems)
        }.navigationBarItems(leading: EditButton(), trailing: Button(action: eateries.addItem) {
            Label("", systemImage: "plus")
        })
    }
}


//struct MasterView_Previews: PreviewProvider {
//    static var previews: some View {
//        MasterView(restaurants:restaurants)
//    }
//}
