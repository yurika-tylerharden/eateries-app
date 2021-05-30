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
        HStack {
            Spacer()
            ImageTitleView().environmentObject(restaurant)
            Spacer()
        }.padding(.top, 20)
        //The listcontaining all restaurant details such as description, story, recipes, and ingredients
        RestaurantDetailListView().environmentObject(restaurant)
    }
}
struct ImageTitleView: View {
    @EnvironmentObject var restaurant: Restaurant

    var body: some View {
        VStack() {
            //image from URL
            Image(uiImage: restaurant.imageURL)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200)
                .border(Color.blue)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 7)
                .animation(.easeInOut)
            Text(restaurant.nameString)
                .font(.largeTitle)
                .padding([.leading, .bottom, .trailing], 15)
                .padding(.top, 5)
        }
    }
}


//Structure containing restaurant details
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
                ReviewRowDetailView(review: review)
            }.padding(8.0)
        }.padding(8.0)
    }
}

struct ReviewRowDetailView: View {
    @ObservedObject var review: Review
    var body: some View {
        VStack(alignment: .leading){
            //image of food converted from imageURL
            Text(review.reviewer)
                .foregroundColor(.pink)
                .padding(.vertical, 5)
            Text(review.comment)
                .font(.subheadline)
                .italic()
                .padding(.leading, 30)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
            RouterView(restaurant: restaurantsDefaultData.restaurant[0])
    }
}
