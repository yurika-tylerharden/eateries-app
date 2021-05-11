//
//  RestaurantModel.swift
//  Eateries
//
//  Created by Tyler Harden on 4/5/21.
//

import Foundation
import SwiftUI
//import Combine
//import UIKit

class Restaurant: ObservableObject, Decodable, Encodable, Identifiable {
//    public var id = UUID()
    @Published var name: String
    @Published var location: String
    @Published var notes: String
    @Published var image: String
    @Published var reviews: Array<String>
    
    init(name: String, location: String, notes: String, image: String, reviews: Array<String>) {
        self.name = name
        self.location = location
        self.notes = notes
        self.image = image
        self.reviews = reviews
    }

    enum CodingKeys: String, CodingKey, RawRepresentable {
        case name
        case location
        case notes
        case image
        case reviews
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        location = try container.decode(String.self, forKey: .location)
        notes = try container.decode(String.self, forKey: .notes)
        image = try container.decode(String.self, forKey: .image)
        reviews = try container.decode(Array.self, forKey: .reviews)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(location, forKey: .location)
        try container.encode(notes, forKey: .notes)
        try container.encode(image, forKey: .image)
        try container.encode(reviews, forKey: .reviews)
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
}

//struct Restaurant: Hashable, Codable, Identifiable   {
//    public var id = UUID()
//
//    var name: String
//    var location: String
//    var notes: String
//    var image: String
//    var reviews: Array<String>
//
//    //will return UIImage from a URL string
//    var imageURL: UIImage {
//        let emptyImage = UIImage(named: "placeholder")!
//        if image == "" {
//            return emptyImage
//
//        }
//        guard let url = URL(string: image) else {
//            return emptyImage
//        }
//        guard let data = try? Data(contentsOf: url) else {
//            return emptyImage
//        }
//        guard let uiImage = UIImage(data: data) else {
//            return UIImage()
//        }
//        return uiImage
//    }
//}
//
//extension Binding where Value: MutableCollection, Value.Element: Identifiable {
//    /// Subscript for a given, identifiable element
//    subscript(identifiedBy element: Value.Element) -> Binding<Value.Element> {
//        return Binding<Value.Element>(get: {
//            return wrappedValue.first { $0.id == element.id } ?? element
//        }, set: { newValue in
//            guard let i = wrappedValue.firstIndex(where: { $0.id == element.id }) else { return }
//            wrappedValue[i] = newValue
//        })
//    }
//}
