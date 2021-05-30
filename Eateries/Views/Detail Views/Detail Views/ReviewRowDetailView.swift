//
//  ReviewRowDetailView.swift
//  Eateries
//
//  Created by Tyler Harden on 30/5/21.
//

import SwiftUI


struct ReviewRowDetailView: View {
    @EnvironmentObject var review: Review
    var body: some View {
        VStack(alignment: .leading){
            //image of food converted from imageURL
            Text(review.reviewer)
                .foregroundColor(.pink)
                .padding(.vertical, 5)
            Text(review.comment)
                .font(.subheadline)
                .italic()
                .padding(.leading, 30)
        }
    }
}
