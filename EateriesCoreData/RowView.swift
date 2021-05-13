//
//  RowView.swift
//  EateriesCoreData
//
//  Created by Tyler Harden on 13/5/21.
//

import SwiftUI

struct RowView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var restaurant: Restaurant
    var body: some View {

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
                Text(restaurant.nameString)
                    .foregroundColor(.pink)
                Text(restaurant.locationString)
                    .font(.subheadline)
                    .italic()
            }
        }
            
    }
}

//struct RowView_Previews: PreviewProvider {
//    static var previews: some View {
//        RowView()
//    }
//}
