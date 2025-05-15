//
//  MapView.swift
//  RallyPrototype
//
//  Created by Mansib Waiz on 2025-05-15.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var position: MapCameraPosition = .userLocation(fallback: .automatic)
    
    var body: some View {
        Map(position: $position) {
            
        }
        .mapControls {
            MapUserLocationButton()
            MapPitchToggle()
        }
        .onAppear {
            CLLocationManager().requestWhenInUseAuthorization()
        }
    }
}
    
#Preview {
    MapView()
}
