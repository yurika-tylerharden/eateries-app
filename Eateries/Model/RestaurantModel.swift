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

class Eateries: ObservableObject, Decodable, Encodable, Identifiable  {
    @Published public var restaurant: [Restaurant]
    @Published public var navigationTitleString: String
    init(restaurant: [Restaurant], navigationTitleString: String) {
        self.restaurant = restaurant
        self.navigationTitleString = navigationTitleString
    }
    
    enum CodingKeys: String, CodingKey, RawRepresentable {
        case restaurant
        case navigationTitleString
        
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        restaurant = try container.decode(Array.self, forKey: .restaurant)
        navigationTitleString = try container.decode(String.self, forKey: .navigationTitleString)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(restaurant, forKey: .restaurant)
        try container.encode(navigationTitleString, forKey: .navigationTitleString)

    }
}

class Restaurant: ObservableObject, Decodable, Encodable, Identifiable {
//    public var id = UUID()
    @Published public var name: String
    @Published public var location: Location
    @Published public var notes: String
    @Published public var image: String
    @Published public var review: [Review]
    
    init(name: String, location: Location, notes: String, image: String, review: [Review]) {
        self.name = name
        self.location = location
        self.notes = notes
        self.image = image
        self.review = review
    }

    enum CodingKeys: String, CodingKey, RawRepresentable {
        case name
        case location
        case notes
        case image
        case review
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        location = try container.decode(Location.self, forKey: .location)
        notes = try container.decode(String.self, forKey: .notes)
        image = try container.decode(String.self, forKey: .image)
        review = try container.decode(Array.self, forKey: .review)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(location, forKey: .location)
        try container.encode(notes, forKey: .notes)
        try container.encode(image, forKey: .image)
        try container.encode(review, forKey: .review)
    }
    public struct Location: Decodable, Encodable {
        var name: String
        var latitude: Double
        var longitude: Double
    }
    
}

class Review: ObservableObject, Decodable, Encodable, Identifiable {
    @Published public var reviewer: String
    @Published public var comment: String
    
    init(reviewer: String, comment: String) {
        self.reviewer = reviewer
        self.comment = comment
    }

    enum CodingKeys: String, CodingKey, RawRepresentable {
        case reviewer
        case comment
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        reviewer = try container.decode(String.self, forKey: .reviewer)
        comment = try container.decode(String.self, forKey: .comment)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(reviewer, forKey: .reviewer)
        try container.encode(comment, forKey: .comment)
    }
}


