//
//  DetailView.swift
//  EateriesCoreData
//
//  Created by Tyler Harden on 13/5/21.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var restaurant: Restaurant
    
    var body: some View {
            VStack() {
                //image from URL
                Image(uiImage: restaurant.imageURL)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 7)
                    .padding(20)
                    .animation(.easeInOut)
                Text(restaurant.nameString)
                    .font(.largeTitle)
                    .padding([.leading, .bottom, .trailing], 15)
                    .padding(.top, 5)
            }
            //The navigation view containing all restaurant details such as description, story, recipes, and ingredients
            RestaurantDetailListView(restaurant: restaurant)
    }
}

//Structure containing restaurant details
struct RestaurantDetailListView: View {
    @ObservedObject var restaurant: Restaurant
    var body: some View {
        Section(header: Text("Location")) {
            Text(restaurant.locationString)
                .font(.callout)
                .foregroundColor(Color.gray)
                .italic()
                .padding(8.0)
        }.padding(8.0)
        Section(header: Text("Notes")) {
            Text(restaurant.notesString)
                .font(.subheadline)
                .padding(8.0)
        }.padding(8.0)
        Section(header: Text("Reviews")) {
            ForEach(restaurant.reviewArray) { review in
                ReviewRowDetailView(review: review)
            }
        }.padding(8.0)
    }
}

struct ReviewRowDetailView: View {
    @ObservedObject var review: Review
    var body: some View {
        VStack {
            //image of food converted from imageURL
            Text(review.reviewerString)
                .foregroundColor(.pink)
            Text(review.commentString)
                .font(.subheadline)
                .italic()
                .padding(.leading, 30)
        }
    }
}
