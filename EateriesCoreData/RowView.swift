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
        Text(restaurant.nameString)
    }
}

//struct RowView_Previews: PreviewProvider {
//    static var previews: some View {
//        RowView()
//    }
//}
