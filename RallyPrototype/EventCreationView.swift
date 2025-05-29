//
//  EventCreationView.swift
//  RallyPrototype
//
//  Created by Mansib Waiz on 2025-05-22.
//

import SwiftUI

struct EventCreationView: View {
    @State private var eventTitle: String = ""
    @State private var selectedDate = Date()
    @State private var location: String = "Set Location"
    
    @State private var navigateToHomeView = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    VStack(spacing: 20) {
                        TextField("Event Title", text: $eventTitle)
                            .font(.title.bold())
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                        
                        Divider()
                            .frame(width: 300 ,height: 2)
                            .frame(maxWidth: .infinity)
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
                            .frame(maxWidth: .infinity)
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
                                    .stroke(Color.purple, lineWidth: 2))
                    )
                    .padding(.horizontal)
                }
                
                VStack {
                    HStack {
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
                        .padding(.top, 60)
                        .padding(.leading, 20)
                        Spacer()
            
                    }
                    Spacer()
                }
                .ignoresSafeArea()
            }
            .navigationDestination(isPresented: $navigateToHomeView) {
                HomeView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    EventCreationView()
}
