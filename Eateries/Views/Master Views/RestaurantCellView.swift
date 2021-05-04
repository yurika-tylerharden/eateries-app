//
//  RestaurantCellView.swift
//  Eateries
//
//  Created by Tyler Harden on 4/5/21.
//

import SwiftUI

import SwiftUI

struct RestaurantCell : View {
    @Binding var restaurant: Restaurant

    var body: some View {
        return NavigationLink(
            destination: RestaurantDetail(restaurant: $restaurant),
            label: {
                //displays image and name/decription inside a hstack
                HStack {
                    //image of food converted from imageURL
                    Image(uiImage: restaurant.imageURL)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 70, height: 70)
                        .clipped()
                        .padding(5)
                                       
                    //name and description of food
                    VStack(alignment: .leading) {
                        Text(restaurant.name)
                            .foregroundColor(.pink)
                        Text(restaurant.location)
                            .font(.subheadline)
                            .italic()
                    }
                }
            }
        )
    }
}
