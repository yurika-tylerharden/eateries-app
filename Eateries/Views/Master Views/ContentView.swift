//
//  ContentView.swift
//  Eateries
//
//  Created by Tyler Harden on 4/5/21.
//

import SwiftUI
//This structure defines the master view of the app containing a list of recipes
struct ContentView: View {
    @ObservedObject var eateries: Eateries

    var body: some View {
        //place NavigationView inside the body
        NavigationView {
            //List inside NavigationView
            MasterView(eateries: eateries)
        }
        //Fixes issues with navigation view on iPad and larger devices
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(restaurants: Binding(get: {
//            EateriesApp.model
//        }, set: { newValue in
//            EateriesApp.model = newValue
//        }))
//    }
//}
