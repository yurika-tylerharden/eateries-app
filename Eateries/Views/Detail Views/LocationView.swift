//
//  LocationView.swift
//  Eateries
//
//  Created by Tyler Harden on 27/5/21.
//

import SwiftUI

struct LocationView: View {
    @ObservedObject var location: LocationViewModel

    var body: some View {
        VStack {
            VStack {
                LazyTextField(prompt: "Enter name", text: $location.model.name, onCommit: { location.lookupPosition() })
                LazyTextField(prompt: "Enter latitude", text: $location.latitudeString, onCommit: { location.lookupName() })
                LazyTextField(prompt: "Enter longitude", text: $location.longitudeString, onCommit: { location.lookupName() })
//                TextField("Enter location", text: $location.model.name)
            }.padding()
            MapView(viewModel: location)
        }.onDisappear(perform: LocationViewModel.save(self.location))
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(location: LocationViewModel(name: "Brisbane", latitude: -27.35, longitude: 153.026))
    }
}
