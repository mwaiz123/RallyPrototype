//
//  ContentView.swift
//  RallyPrototype
//
//  Created by Mansib Waiz on 2025-04-10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Rally")
                    .font(.system(size: 36, weight: .bold))
                    .padding(.bottom, 6)
                
                Text("Where Plans Come Together")
                    .padding(.bottom, 50)
                
                NavigationLink("Login", destination: LoginView())
                    .foregroundStyle(.white)
                    .frame(width: 300, height: 50)
                    .background(.blue)
                    .cornerRadius(10)
                
                NavigationLink("Continue As Guest", destination: HomeView())
                    .foregroundStyle(.white)
                    .frame(width: 300, height: 50)
                    .background(.gray)
                    .cornerRadius(10)
                    .padding(.top, 5)
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
}

