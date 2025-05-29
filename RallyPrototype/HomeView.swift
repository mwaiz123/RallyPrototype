//
//  HomeView.swift
//  RallyPrototype
//
//  Created by Mansib Waiz on 2025-04-10.
//

import SwiftUI
import MapKit

struct HomeView: View {
    @State private var showSheet = false
    @State private var navigateToEventCreation = false
    @State private var shouldNavigateAfterDismiss = false

    var body: some View {
        NavigationStack {
            ZStack {
                MapView(isSheetPresented: $showSheet)
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .task {
                showSheet = true
            }
            .navigationDestination(isPresented: $navigateToEventCreation) {
                EventCreationView()
            }
            .onChange(of: showSheet) {
                if showSheet == false && shouldNavigateAfterDismiss {
                    navigateToEventCreation = true
                    shouldNavigateAfterDismiss = false
                }
            }
            .sheet(isPresented: $showSheet) {
                VStack {
                    Button(action: {
                        shouldNavigateAfterDismiss = true
                        showSheet = false
                    }) {
                        Text("Create Event")
                            .font(.title)
                            .padding(.vertical, 20)
                            .frame(maxWidth: .infinity)
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
            }
        }
    }
}

#Preview {
    HomeView()
}
