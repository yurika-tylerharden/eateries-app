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
        EditRestaurantDetailListView().environmentObject(restaurant)
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(restaurant: restaurantsDefaultData.restaurant[0])
    }
}
