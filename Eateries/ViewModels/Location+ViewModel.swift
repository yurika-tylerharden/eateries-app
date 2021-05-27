//
//  Location+ViewModel.swift
//  Eateries
//
//  Created by Tyler Harden on 27/5/21.
//

import Foundation

class LocationViewModel: NSObject, ObservableObject {
    @Published var model: Restaurant.Location
    @Published var latitudeSpan = 0.1
    @Published var longitudeSpan = 0.1

    init(name: String, latitude: Double, longitude: Double) {
        model = Restaurant.Location(name: name, latitude: latitude, longitude: longitude)
    }

    var latitudeString: String {
        get { "\(model.latitude)" }
        set {
            guard let doubleValue = Double(newValue) else { return }
            model.latitude = doubleValue
        }
    }

    var longitudeString: String {
        get { "\(model.longitude)" }
        set {
            guard let doubleValue = Double(newValue) else { return }
            model.longitude = doubleValue
        }
    }
}

extension LocationViewModel {
    func save() {
        let newData = Restaurant.Location(name: model.name, latitude: model.latitude, longitude: model.longitude)
        print(newData)
        model = newData
        print(model)
        EateriesApp.save()
    }
}
