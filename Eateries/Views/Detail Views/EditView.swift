//
//  RestaurantEditView.swift
//  Eateries
//
//  Created by Tyler Harden on 4/5/21.
//

import SwiftUI

struct EditView: View {
    @ObservedObject var restaurant: Restaurant
    
    var body: some View {
            HStack {
                Text("Restaurant Name:")
                    .padding(.leading, 16)
                TextField("Enter URL", text: $restaurant.nameString)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }
            HStack {
                Text("Image URL:")
                    .padding(.leading, 16)
                TextField("Enter URL", text: $restaurant.imageString)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }
            //Navigation view containing list of the relevant information about selected food, divided into sections
            EditRestaurantDetailListView(restaurant: restaurant)
    }
}

struct EditRestaurantDetailListView: View {
    @ObservedObject var restaurant: Restaurant
    
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

struct ReviewRowEditView: View {
    @ObservedObject var review: Review
    var body: some View {
        VStack {
            //image of food converted from imageURL
            TextEditor(text: $review.reviewer)
                .foregroundColor(.pink)
            TextEditor(text: $review.comment)
                .font(.subheadline)
                .padding(.leading, 30)
        }
    }
}
