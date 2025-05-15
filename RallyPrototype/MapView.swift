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
    @State private var isNavigating = false

    var body: some View {
        ZStack(alignment: .topLeading) {
            Map(position: $position) {}
            .ignoresSafeArea()

            HStack {
                Button {
                    isSheetPresented = false
                    isNavigating = true
                } label: {
                    Image(systemName: "magnifyingglass")
                        .font(.title3)
                        .foregroundColor(.primary)
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(radius: 2)
                }
                .padding(.top, 30)
                .padding(.leading, 20)
            }
        }
        .navigationDestination(isPresented: $isNavigating) {
            SearchView()
        }
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
