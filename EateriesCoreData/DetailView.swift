//
//  DetailView.swift
//  EateriesCoreData
//
//  Created by Tyler Harden on 13/5/21.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var restaurant: Restaurant
    
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
                    Text(restaurant.nameString)
                        .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                        .padding([.leading, .bottom, .trailing], 15)
                        .padding(.top, 5)
                    //The navigation view containing all restaurant details such as description, story, recipes, and ingredients
                    RestaurantDetailListView(restaurant: restaurant)

                }
            }
        
    }
}

//Structure containing restaurant details
struct RestaurantDetailListView: View {
    @ObservedObject var restaurant: Restaurant
    var body: some View {
        
            List {
                Section(header: Text("Location")) {
                    Text(restaurant.locationString)
                        .font(.callout)
                        .foregroundColor(Color.gray)
                        .italic()
                        .padding(8.0)
                }
                Section(header: Text("Notes")) {
                    Text(restaurant.notesString)
                        .font(.subheadline)
                        .padding(8.0)
                }
//                Section(header: Text("Reviews")) {
//                    ForEach(restaurant.reviews, id: \.self) { review in
//                        Text(review)
//                            .font(.subheadline)
//                            .padding(8.0)
//                    }
//                    ForEach(restaurant.reviews) {
//                        ReviewCell(review: $reviews[identifiedBy: $0])
//                    }
            }.navigationBarHidden(true)
    }
}

//struct BindingViewExamplePreviewContainer_1 : View {
//    @State var restaurant = restaurants[3]
//
//
//     var body: some View {
//        DetailView(restaurant: restaurant)
//     }
//}

//#if DEBUG
//struct BindingViewExample_1_Previews : PreviewProvider {
//    static var previews: some View {
//        BindingViewExamplePreviewContainer_1()
//    }
//}
//#endif

