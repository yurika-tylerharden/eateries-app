//
//  ReviewRowEditView.swift
//  Eateries
//
//  Created by Tyler Harden on 30/5/21.
//

import SwiftUI

struct ReviewRowEditView: View {
    @ObservedObject var review: Review
    var body: some View {
        VStack(alignment: .leading) {
            //image of food converted from imageURL
            TextEditor(text: $review.reviewer)
                .foregroundColor(.pink)
                .padding(.vertical, 5)

            TextEditor(text: $review.comment)
                .font(.subheadline)
                .padding(.leading, 30)
        }
    }
}
