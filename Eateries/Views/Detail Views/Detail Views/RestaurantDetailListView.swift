//
//  RestaurantDetailListView.swift
//  Eateries
//
//  Created by Tyler Harden on 30/5/21.
//

import SwiftUI

struct RestaurantDetailListView: View {
    @EnvironmentObject var restaurant: Restaurant
    
    var body: some View {
        Section(header: Text("Location")) {
            NavigationLink(
                destination: LocationView(location: restaurant.location).environmentObject(restaurant),
                label: {
                    Text(restaurant.location.name)
                        .padding(8.0)
                        .font(.subheadline)
                }
            )
        }.padding(8.0)
        Section(header: Text("Notes")) {
            Text(restaurant.notesString)
                .font(.subheadline)
                .padding(8.0)
        }.padding(8.0)
        Section(header: Text("Reviews")) {
            ForEach(restaurant.review) { review in
                ReviewRowDetailView().environmentObject(review)
            }.padding(8.0)
        }.padding(8.0)
    }
}
