//
//  MapView.swift
//  Eateries
//
//  Created by Tyler Harden on 27/5/21.
//

import MapKit
import UIKit
import SwiftUI

struct MapView: UIViewRepresentable {
    @ObservedObject var viewModel: LocationViewModel

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = viewModel
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.setRegion(viewModel.region, animated: true)
    }
}
