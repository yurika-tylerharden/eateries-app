//
//  RestaurantDetailView.swift
//  Eateries
//
//  Created by Tyler Harden on 4/5/21.
//

import SwiftUI


struct DetailView: View {
    @Binding var restaurant: Restaurant
    
    var body: some View {
            GeometryReader { metric in
                VStack() {
                    //image from URL
                    Image(uiImage: restaurant.imageURL)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: metric.size.height * 0.4, height: metric.size.height * 0.4)
                        .clipped()
                        .scaledToFit()
                        .padding([.leading, .bottom, .trailing], 30)
                        .animation(.easeInOut)
                    Text("\(restaurant.name)")
                        .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                        .padding([.leading, .bottom, .trailing], 15)
                        .padding(.top, 5)
                    //The navigation view containing all restaurant details such as description, story, recipes, and ingredients
                    RestaurantDetailListView(restaurant: $restaurant)

                }
            }
        
    }
}



struct BindingViewExamplePreviewContainer_1 : View {
    @State var restaurant = restaurants[3]


     var body: some View {
        DetailView(restaurant: $restaurant)
     }
}

#if DEBUG
struct BindingViewExample_1_Previews : PreviewProvider {
    static var previews: some View {
        BindingViewExamplePreviewContainer_1()
    }
}
#endif

//Structure containing restaurant details
struct RestaurantDetailListView: View {
    @Binding var restaurant: Restaurant
    var body: some View {
        
            List {
                Section(header: Text("Location")) {
                    Text(restaurant.location)
                        .font(.callout)
                        .foregroundColor(Color.gray)
                        .italic()
                        .padding(8.0)
                }
                Section(header: Text("Notes")) {
                    Text(restaurant.notes)
                        .font(.subheadline)
                        .padding(8.0)
                }
                Section(header: Text("Reviews")) {
                    ForEach(restaurant.reviews, id: \.self) { review in
                        Text(review)
                            .font(.subheadline)
                            .padding(8.0)
                    }
                }
            }.navigationBarHidden(true)
    }
}
