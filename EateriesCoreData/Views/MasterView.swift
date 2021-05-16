//
//  MasterView.swift
//  EateriesCoreData
//
//  Created by Tyler Harden on 13/5/21.
//

import SwiftUI

struct MasterView: View {
    @ObservedObject var eateries: Eateries
    @Environment(\.editMode) var mode
    
    var body: some View {
        VStack {
            TitleEditor(eateries: eateries)
            List {
                ForEach(eateries.restaurantArray) { restaurant in
                    NavigationLink(
                        destination: RouterView(restaurant: restaurant),
                        label: {
                            RowView(restaurant: restaurant)
                        })
                }
                .onDelete { offsets in
                    withAnimation { eateries.deleteItems(offsets: offsets) }
                }
                .onMove {
                    eateries.restaurantArray.move(fromOffsets: $0, toOffset: $1)
                    eateries.save()
                }
            }.navigationBarItems(leading: EditButton(), trailing: Button(action: {
                withAnimation { eateries.addItem() } }) { Label("", systemImage: "plus")
            })
            .listStyle(InsetGroupedListStyle())
        }.navigationBarTitle(self.mode?.wrappedValue == .active ? Text("") : Text(eateries.navigationTitleString) )
    }
}
struct TitleEditor: View {
    @Environment(\.editMode) var mode
    @ObservedObject var eateries: Eateries

    var body: some View {
        if self.mode?.wrappedValue.isEditing ?? true {
            HStack {
                Text("Enter title:")
                    .padding(.leading, 16)
                TextField("Enter title here", text: $eateries.navigationTitleString)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }.onDisappear {
                eateries.save()
            }
        }
    }
}


//struct MasterView_Previews: PreviewProvider {
//    static var previews: some View {
//        MasterView(restaurants:restaurants)
//    }
//}
