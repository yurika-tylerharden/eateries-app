//
//  RestaurantDetailView.swift
//  Eateries
//
//  Created by Tyler Harden on 4/5/21.
//

import SwiftUI


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
            NavigationLink(
                destination: LocationView(location: LocationViewModel(name: restaurant.location.name, latitude: restaurant.location.latitude, longitude: restaurant.location.longitude)),
                label: {
                    Text(restaurant.location.name)
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
            Text(review.reviewer)
                .foregroundColor(.pink)
            Text(review.comment)
                .font(.subheadline)
                .italic()
                .padding(.leading, 30)
        }
    }
}
