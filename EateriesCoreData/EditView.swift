//
//  EditView.swift
//  EateriesCoreData
//
//  Created by Tyler Harden on 13/5/21.
//

import SwiftUI

struct EditView: View {
    @ObservedObject var restaurant: Restaurant
    @Environment(\.editMode) var mode
    var body: some View {
        VStack() {
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
            EditRestaurantDetailListView(restaurant: restaurant)
        }
//        .onDisappear {
//            EateriesApp.save()
//        }
    }
}

struct EditRestaurantDetailListView: View {
    @ObservedObject var restaurant: Restaurant
    @Environment(\.editMode) var mode
    
    var body: some View {

            List {
                Section(header: Text("Location")) {
                    
                    TextEditor(text: $restaurant.locationString)
                        .font(.callout)
                        .foregroundColor(Color.gray)
                        .padding(8.0)
                }.padding(8.0)
                Section(header: Text("Notes")) {
                    TextEditor(text: $restaurant.notesString)
                        .font(.subheadline)
                        .padding(8.0)
                }.padding(8.0)
//                Section(header: HStack {
//                    Text("Reviews")
//                    Button(action: {
//                        withAnimation {
//                            restaurant.addItem()
//                        }
//                    }) {
//                        Label("", systemImage: "plus")
//                    }
//                }) {
//                    ForEach(restaurant.reviewArray) { review in
//                        ReviewRowView(review: review)
//                    }
//                }.padding(8.0)
            }.navigationBarHidden(true)
            
    }

}


//struct BindingViewExamplePreviewContainer_2 : View {
//    @State var restaurant = restaurants[0]
//
//     var body: some View {
//        EditView(restaurant: $restaurant)
//     }
//}

//#if DEBUG
//struct BindingViewExample_2_Previews : PreviewProvider {
//    static var previews: some View {
//        BindingViewExamplePreviewContainer_2()
//    }
//}
//#endif
