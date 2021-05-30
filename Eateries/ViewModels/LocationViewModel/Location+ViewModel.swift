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

    init(model: Restaurant.Location) {
        self.model = model
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

