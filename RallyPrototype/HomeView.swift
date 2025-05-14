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
    let locationManager = CLLocationManager()
    
    var body: some View {
        NavigationStack {
            MapView()
                .task {
                    showSheet = true
                }
                .sheet(isPresented: $showSheet, content: {
                    VStack {
                        Text("Placeholder")
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
    }
}


#Preview {
    HomeView()
}
