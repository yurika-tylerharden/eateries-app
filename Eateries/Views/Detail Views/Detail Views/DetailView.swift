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
            DetailImageTitleView().environmentObject(restaurant)
            Spacer()
        }.padding(.top, 20)
        //The listcontaining all restaurant details such as description, story, recipes, and ingredients
        RestaurantDetailListView().environmentObject(restaurant)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
            RouterView(restaurant: restaurantsDefaultData.restaurant[0])
    }
}
