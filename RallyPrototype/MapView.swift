//
//  MapView.swift
//  RallyPrototype
//
//  Created by Mansib Waiz on 2025-04-23.
//

import SwiftUI
import MapKit

struct MapView: View {
    let locationManager = CLLocationManager()
    
    var body: some View {
        NavigationStack {
                Map(initialPosition: .camera(MapCamera(
                    centerCoordinate: CLLocationCoordinate2D(latitude: 43.651070, longitude: -79.389015),
                    distance: 150000)))
            
                .onAppear {
                    locationManager.requestWhenInUseAuthorization()
                }
            
                .ignoresSafeArea()
        }
        .navigationBarHidden(true)
    }
}
        

#Preview {
    MapView()
}
