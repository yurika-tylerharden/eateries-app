//
//  LocationView.swift
//  Eateries
//
//  Created by Tyler Harden on 27/5/21.
//

import SwiftUI

struct LocationView: View {
    @ObservedObject var locationViewModel:LocationViewModel
//    var location: Restaurant.Location
    @EnvironmentObject var restaurant: Restaurant
    
    init(location: Restaurant.Location)
    {
        locationViewModel = LocationViewModel(model: location)
    }
    
    var body: some View {
        GeometryReader { metric in
            VStack {
                MapView(viewModel: locationViewModel)
                    .frame(height: metric.size.height * 0.5)
                List {
                    //User entry for location name
                    HStack {
                        Text("Location:")
                            .fontWeight(.bold)
                            .padding(.leading, 16)
                        TextField("Enter name", text: $locationViewModel.model.name, onCommit: { saveLocationData()
                        })
                    }
                    //User entry for latitude which activates lookupName function on commit
                    HStack {
                        Text("Latitude:")
                            .fontWeight(.bold)
                            .padding(.leading, 16)
                        LazyTextField(prompt: "Enter latitude", text: $locationViewModel.latitudeString, onCommit: { locationViewModel.lookupName() })
                    }
                    //User entry for longitude which activates lookupName function on commit
                    HStack {
                        Text("Longitude:")
                            .fontWeight(.bold)
                            .padding(.leading, 16)
                        
                        LazyTextField(prompt: "Enter longitude", text: $locationViewModel.longitudeString, onCommit: { locationViewModel.lookupName() })
                    }
                    //Button that activates lookupPosition function when pressed
                    Button(action: {
                        locationViewModel.lookupPosition()
                    }) {
                        HStack {
                            Spacer()
                            Text("Find coordinates")
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .padding(10)
                            Spacer()
                        }
                            
                    }.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    
                }.listStyle(InsetGroupedListStyle())
            }.onDisappear{
                //Assign the updated location model to the observing restaurant object
                saveLocationData()
            }
        }
    }
    private func saveLocationData() {
        restaurant.location = locationViewModel.model
        restaurant.saveLocationData()
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(location: restaurantsDefaultData.restaurant[0].location)
    }
}
