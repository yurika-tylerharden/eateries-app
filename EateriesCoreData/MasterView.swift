//
//  MasterView.swift
//  EateriesCoreData
//
//  Created by Tyler Harden on 13/5/21.
//

import SwiftUI

struct MasterView: View {
    @Environment(\.managedObjectContext) private var viewContext
    var restaurants: FetchedResults<Restaurant>
    var body: some View {
        List {
            ForEach(restaurants) { restaurant in
                Text(restaurant.nameString)
            }
            .onDelete(perform: deleteItems)
        }.navigationBarItems(leading: EditButton(), trailing: Button(action: addItem) {
            Label("", systemImage: "plus")
        })
    }
    private func addItem() {
        withAnimation {
            let newRestaurant = Restaurant(context: viewContext)
            newRestaurant.name = "New restaurant"

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

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { restaurants[$0] }.forEach(viewContext.delete)

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
}


//struct MasterView_Previews: PreviewProvider {
//    static var previews: some View {
//        MasterView(restaurants:restaurants)
//    }
//}
