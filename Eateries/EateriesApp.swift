//
//  EateriesApp.swift
//  Eateries
//
//  Created by Tyler Harden on 4/5/21.
//

import SwiftUI

@main
struct EateriesApp: App {
    
    @State var model: [Restaurant] = EateriesApp.model
    static var model: [Restaurant] = {
        guard let data  = try? Data(contentsOf: EateriesApp.fileURL),
              let model = try? JSONDecoder().decode([Restaurant].self, from: data) else {
            return restaurants
        }
        return model
    }()
    static var modelBinding: Binding<[Restaurant]>?
    

    var body: some Scene {
        EateriesApp.modelBinding = $model
        return WindowGroup {
            MasterView(restaurants: $model)
        }
    }

    static var fileURL: URL {
        let fileName = "restaurants.json"
        let fm = FileManager.default
        guard let documentDir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return URL(fileURLWithPath: "/") }
        let fileURL = documentDir.appendingPathComponent(fileName)
        return fileURL
    }

    static func save() {
        do {
            let data = try JSONEncoder().encode(modelBinding?.wrappedValue ?? model)
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
        location: "Griffith",
        notes: "Nice food",
        image: "https://www.jessicagavin.com/wp-content/uploads/2017/07/meat-lasagna-1200.jpg",
        reviews: ["Rene", "Busy place"]
    ),
    Restaurant(
        name: "Cafe Rossa",
        location: "Griffith",
        notes: "Nice food",
        image: "https://www.jessicagavin.com/wp-content/uploads/2017/07/meat-lasagna-1200.jpg",
        reviews: ["Rene", "Busy place"]
    ),
    Restaurant(
        name: "Cafe Rossa",
        location: "Griffith",
        notes: "Nice food",
        image: "https://www.jessicagavin.com/wp-content/uploads/2017/07/meat-lasagna-1200.jpg",
        reviews: ["Rene", "Busy place"]
    )
]
