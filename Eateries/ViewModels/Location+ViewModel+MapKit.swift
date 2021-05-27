//
//  Location+ViewModel+MapKit.swift
//  Eateries
//
//  Created by Tyler Harden on 27/5/21.
//

import MapKit

private var updateCount = 0

extension LocationViewModel: MKMapViewDelegate {
    var coordinateSpan: MKCoordinateSpan {
        get { MKCoordinateSpan(latitudeDelta: latitudeSpan, longitudeDelta: longitudeSpan) }
        set {
            latitudeSpan  = newValue.latitudeDelta
            longitudeSpan = newValue.longitudeDelta
        }
    }

    var region: MKCoordinateRegion {
        get { MKCoordinateRegion(center: coordinates, span: coordinateSpan) }
        set { coordinateSpan = newValue.span }
    }

    @objc func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        let centre = mapView.centerCoordinate
        updateCount += 1
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(250)) {
            updateCount -= 1
            guard updateCount == 0 else { return }
            self.coordinates = centre
        }
    }
}
