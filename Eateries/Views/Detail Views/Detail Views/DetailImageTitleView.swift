//
//  DetailImageTitleView.swift
//  Eateries
//
//  Created by Tyler Harden on 30/5/21.
//

import SwiftUI

struct DetailImageTitleView: View {
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
