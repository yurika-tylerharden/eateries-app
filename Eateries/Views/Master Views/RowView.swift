//
//  RestaurantCellView.swift
//  Eateries
//
//  Created by Tyler Harden on 4/5/21.
//

import SwiftUI

struct RowView: View {
    @ObservedObject var restaurant: Restaurant
    var body: some View {

        HStack {
            //image of food converted from imageURL
            Image(uiImage: restaurant.imageURL)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .shadow(radius: 3)
                .padding(10)
                               
            //name and description of food
            VStack(alignment: .leading) {
                Text(restaurant.nameString)
                    .foregroundColor(.pink)
                Text(restaurant.location.name)
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
                    .italic()
            }
        }
            
    }
}
