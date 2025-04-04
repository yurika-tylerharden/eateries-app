//
//  Restaurant+ViewModel.swift
//  Eateries
//
//  Created by Tyler Harden on 27/5/21.
//


import Foundation
import UIKit

extension Restaurant {
    // Non-optional ViewModel name property
    var nameString: String {
        get { name as String}
        set { name = newValue}
    }
    var notesString: String {
        get { notes as String }
        set { notes = newValue}
    }
    var imageString: String {
        get { image as String }
        set { image = newValue}
    }
    var imageURL: UIImage {
        let emptyImage = UIImage(named: "placeholder")!
        if image == "" {
            return emptyImage
        }
        guard let url = URL(string: image) else {
            return emptyImage
        }
        guard let data = try? Data(contentsOf: url) else {
            return emptyImage
        }
        guard let uiImage = UIImage(data: data) else {
            return UIImage()
        }
        return uiImage
    }
    func addItem() {
        let newReview = Review(reviewer: "Enter name", comment: "Enter review")
        review.append(newReview)
        save()
    }
    func saveLocation(model: Location) {
        location = model
        print(model)
        save()
    }
    func deleteItems(offsets: IndexSet) {
        review.remove(atOffsets: offsets)
        save()
    }
    func save() {
        EateriesApp.save()
    }
}
