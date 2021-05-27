//
//  Location+ViewModel+CoreLocation.swift
//  Eateries
//
//  Created by Tyler Harden on 27/5/21.
//

import CoreLocation

private var isGeoCoding = false

extension LocationViewModel {
    var location: CLLocation {
        get { CLLocation(latitude: model.latitude, longitude: model.longitude) }
        set {
            model.latitude  = newValue.coordinate.latitude
            model.longitude = newValue.coordinate.longitude
        }
    }

    var coordinates: CLLocationCoordinate2D {
        get { CLLocationCoordinate2D(latitude: model.latitude, longitude: model.longitude) }
        set {
            model.latitude = newValue.latitude
            model.longitude = newValue.longitude
        }
    }

    func lookupName() {
        guard !isGeoCoding else { return }
        isGeoCoding = true
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(location) {
            isGeoCoding = false
            guard let placeMarks = $0, let placeMark = placeMarks.first else {
                if let error = $1 {
                    print("Error looking up location \(error.localizedDescription)")
                } else {
                    print("Error looking up location \(String(describing: $1))")
                }
                return
            }
            self.model.name = placeMark.name ?? placeMark.locality ?? placeMark.subLocality ?? placeMark.administrativeArea ?? placeMark.country ?? "<unknown>"
        }
    }

    func lookupPosition() {
        guard !isGeoCoding else { return }
        isGeoCoding = true
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(model.name) {
            isGeoCoding = false
            guard let placeMarks = $0, let placeMark = placeMarks.first,
                  let coordinates = placeMark.location?.coordinate else {
                if let error = $1 {
                    print("Error looking up location \(error.localizedDescription)")
                } else {
                    print("Error looking up location \(String(describing: $1))")
                }
                return
            }
            self.model.latitude  = coordinates.latitude
            self.model.longitude = coordinates.longitude
        }
    }
}
