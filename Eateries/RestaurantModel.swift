//
//  RestaurantModel.swift
//  Eateries
//
//  Created by Tyler Harden on 4/5/21.
//

import Foundation
import SwiftUI
import Combine
import UIKit

struct Restaurant: Hashable, Codable, Identifiable   {
    public var id = UUID()
    
    var name: String
    var location: String
    var notes: String
    var image: String
    var reviews: Array<String>

    //will return UIImage from a URL string
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

    
}

extension Binding where Value: MutableCollection, Value.Element: Identifiable {
    /// Subscript for a given, identifiable element
    subscript(identifiedBy element: Value.Element) -> Binding<Value.Element> {
        return Binding<Value.Element>(get: {
            return wrappedValue.first { $0.id == element.id } ?? element
        }, set: { newValue in
            guard let i = wrappedValue.firstIndex(where: { $0.id == element.id }) else { return }
            wrappedValue[i] = newValue
        })
    }
}
