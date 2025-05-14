//
//  HomeView.swift
//  RallyPrototype
//
//  Created by Mansib Waiz on 2025-04-10.
//

import SwiftUI
import MapKit

struct HomeView: View {
    @State private var showSheet: Bool = false
    @State private var position: MapCameraPosition = .userLocation(fallback: .automatic)
    
    var body: some View {
        NavigationStack {
            Map(position: $position) {
                
            }
            .mapControls {
                MapUserLocationButton()
                MapPitchToggle()
            }
            .onAppear {
                CLLocationManager().requestWhenInUseAuthorization()
            }
            .task {
                showSheet = true
            }
            .sheet(isPresented: $showSheet, content: {
                VStack {
                    Button(action: {}) {
                        Text("Create Event")
                            .font(.title)
                            .padding(.vertical, 20)
                            .frame(maxWidth: .infinity) // Full-width button
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color.purple))
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 0)
                    .padding(.vertical, 5)
                    
                    
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .presentationDetents([.height(280), .medium, .large])
                .presentationCornerRadius(28)
                .presentationBackground(.white)
                .presentationBackgroundInteraction(.enabled(upThrough: .large))
                .interactiveDismissDisabled(true)
            })
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    HomeView()
}
