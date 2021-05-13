//
//  ContentView.swift
//  EateriesCoreData
//
//  Created by Tyler Harden on 13/5/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Eateries.navigationTitle, ascending: true)],
        animation: .default)
    private var eateries: FetchedResults<Eateries>

    var body: some View {
        NavigationView {
            MasterView(eateries: eateries.first ?? Eateries(context: viewContext))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
