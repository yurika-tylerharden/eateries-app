//
//  EditRestaurantDetailListView.swift
//  Eateries
//
//  Created by Tyler Harden on 30/5/21.
//

import SwiftUI

struct EditRestaurantDetailListView: View {
    @EnvironmentObject var restaurant: Restaurant

    var body: some View {
        Section(header: Text("Location")) {
            TextEditor(text: $restaurant.location.name)
                .font(.callout)
                .foregroundColor(Color.gray)
                .padding(8.0)
        }
        Section(header: Text("Notes")) {
            TextEditor(text: $restaurant.notesString)
                .font(.subheadline)
                .padding(8.0)
        }
        Section(header: HStack {
            Text("Reviews")
            Button(action: {
                withAnimation { restaurant.addItem() }
            }) { Label("", systemImage: "plus").foregroundColor(.pink) }
            }) {
            ForEach(restaurant.review) { review in
                ReviewRowEditView(review: review)
            }
            .onDelete { offsets in
                withAnimation { restaurant.deleteItems(offsets: offsets) }
            }
            .onMove { (indices, destination) in
                restaurant.review.move(fromOffsets: indices, toOffset: destination)
                restaurant.save()
            }
        }.padding(8.0)
    }

}

