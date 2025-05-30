//
//  EventCreationView.swift
//  RallyPrototype
//
//  Created by Mansib Waiz on 2025-05-22.
//

import SwiftUI
import MapKit

struct EventCreationView: View {
    @State private var eventTitle: String = ""
    @State private var selectedDate = Date()
    @State private var location: String = "Set Location"
    
    @State private var navigateToHomeView = false

    var body: some View {
            ZStack(alignment: .topLeading) {
                Color.white
                    .ignoresSafeArea(.all)
                ScrollView {
                    VStack {
                        Spacer().frame(height: 140)
                        VStack(spacing: 20) {
                            TextField("Event Title", text: $eventTitle)
                                .font(.title.bold())
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                            Divider()
                                .frame(width: 300, height: 2)
                                .background(Color.purple)
                            VStack {
                                Image(systemName: "calendar.badge.plus")
                                    .foregroundColor(.black)
                                DatePicker("Date and Time", selection: $selectedDate, displayedComponents: [.date, .hourAndMinute])
                                    .labelsHidden()
                                    .tint(.black)
                            }
                            .padding(.horizontal)
                    
                            Divider()
                                .frame(height: 2)
                                .background(Color.purple)
                            VStack {
                                Image(systemName: "mappin.and.ellipse")
                                    .foregroundColor(.black)
                                Text(location)
                                    .foregroundColor(.black)
                            }
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color.purple, lineWidth: 2)
                                )
                        )
                        .padding(.horizontal)
                        Spacer()
                        
                        VStack(spacing: 20) {
                            VStack {
                                Text("Hosted by mansibwaiz")
                                    .font(.title)
                                    .fontWeight(.semibold)
                                
                               Text("Add Description")
                                    .padding(.top, 5)
                            }
                            .padding(.horizontal)
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color.purple, lineWidth: 2)
                                )
                        )
                        .padding(.horizontal)
                        .padding(.top)
                        Spacer()
                        
                        VStack(spacing: 20) {
                            Map()
                                .frame(height: 150)
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color.purple, lineWidth: 2)
                                )
                        )
                        .padding(.horizontal)
                        .padding(.top)
                        Spacer()
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.purple, lineWidth: 2))
                    )
                    .padding(.horizontal)
                }
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
                
                Button {
                    navigateToHomeView = true
                } label: {
                    Text("X")
                        .font(.title2)
                        .foregroundColor(.black)
                        .padding()
                        .background(.white)
                        .clipShape(Circle())
                        .shadow(color: .black, radius: 6)
                }
                .padding(.top, 50)
                .padding(.leading, 25)
            }
            .ignoresSafeArea()
            .navigationDestination(isPresented: $navigateToHomeView) {
                HomeView()
            }
        
    }
}

#Preview {
    EventCreationView()
}

