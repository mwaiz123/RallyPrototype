//
//  MapView.swift
//  RallyPrototype
//
//  Created by Mansib Waiz on 2025-05-15.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapView: View {
    @Binding var isSheetPresented: Bool
    @State private var position: MapCameraPosition = .automatic
    @State private var userCoordinate: CLLocationCoordinate2D?
    @State private var searchText = ""

    var body: some View {
            Map(position: $position) {}
            .ignoresSafeArea()

           
        .onAppear {
            let manager = CLLocationManager()
            manager.requestWhenInUseAuthorization()
            if let location = manager.location {
                let coord = location.coordinate
                userCoordinate = coord
                let region = MKCoordinateRegion(
                    center: coord,
                    span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                )
                position = .region(region)
            }
        }
    }
}

#Preview {
    MapView(isSheetPresented: .constant(true))
}
