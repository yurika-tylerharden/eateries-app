//
//  EateriesApp.swift
//  Eateries
//
//  Created by Tyler Harden on 4/5/21.
//

import SwiftUI

@main
struct EateriesApp: App {
    
    static var model: [Restaurant] = {
        guard let data  = try? Data(contentsOf: EateriesApp.fileURL),
              let model = try? JSONDecoder().decode([Restaurant].self, from: data) else {
            return restaurants
        }
        return model
    }()

    var body: some Scene {
        WindowGroup {
            ContentView(restaurants: Binding(get: {
                EateriesApp.model
            }, set: { newValue in
                EateriesApp.model = newValue
            }))
        }
    }

    static var fileURL: URL {
        let fileName = "eateriesData.json"
        let fm = FileManager.default
        guard let documentDir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return URL(fileURLWithPath: "/") }
        let fileURL = documentDir.appendingPathComponent(fileName)
        return fileURL
    }

    static func save() {
        do {
            let data = try JSONEncoder().encode(model)
            try data.write(to: fileURL, options: .atomic)
            guard let dataString = String(data: data, encoding: .utf8) else { return }
            print(dataString)
        } catch {
            print("Could not write file: \(error)")
        }
    }
}

//
//  FoodData.swift
//  FavouriteFood
//
//  Created by Tyler Harden on 1/4/21.
//
let restaurants = [
    Restaurant(
        name: "Cafe Rossa",
        location: "Griffith University, Nathan Campus",
        notes: "Nice food. Great seating options",
        image: "https://images.squarespace-cdn.com/content/v1/5335837de4b0e01301bd0a77/1466500309913-2IMOYMJT295EZOLS8R7P/ke17ZwdGBToddI8pDm48kHnZiV9DhmPrl2frxwgbsfZ7gQa3H78H3Y0txjaiv_0fP2mUeL88OWNO9bmLu_elLTohiNOp-605NKAb3xRq45EddH7U3QrYFhnn3EmzEjPHOqpeNLcJ80NK65_fV7S1UQNgGYtJFZIFQfvDrAo3zwDzYrfrn2Ic8weeUsiBd1_fnr1xKjsq_-rO8kOgOtwYvw/custom+cafe+furniture+outdoor+seating+bentwood+and+tables+cafe+rossa+%281%29.jpg?format=2500w",
        reviews: ["Ben", "Good simple menu with real gluten free options, decent coffee, pleasant staff."]
    ),
    Restaurant(
        name: "Grill'd",
        location: "Gold Coast Hwy, Nobby's Beach",
        notes: "Burgers, Chips, Salad and Salads at Grill'd",
        image: "https://10619-2.s.cdn12.com/rests/original/107_501922001.jpg",
        reviews: ["Sam", "Very juicy burgers, great chips, great sauces, friendly staff"]
    ),
    Restaurant(
        name: "Cafe Rossa",
        location: "Gold Coast Hwy, Mermaid Beach",
        notes: "Relaxed diner cooking dairy-free vegetarian Asian meals with protein made from soy, wheat and yam.",
        image: "https://b.zmtcdn.com/data/pictures/3/16613723/9b9881e30341b28cff78e66f83acc12f.jpg",
        reviews: ["Sarah", "Great service and staff who are very passionate about serving great food."]
    )
]
