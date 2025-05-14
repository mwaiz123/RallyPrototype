//
//  HomeView.swift
//  RallyPrototype
//
//  Created by Mansib Waiz on 2025-04-10.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showSheet: Bool = false
    var body: some View {
        TabView {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                Text(tab.rawValue)
                    .tag(tab)
                    .tabItem {
                        Image(systemName: tab.symbol)
                        Text(tab.rawValue)
                    }
            }
        }
        .task {
            showSheet = true
        }
        .sheet(isPresented: $showSheet) {
            VStack (alignment: .leading, spacing: nil, content: {
                
            })
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .presentationDetents([.height(60), .medium, .large])
            .presentationCornerRadius(20)
            .presentationBackground(.regularMaterial)
            .presentationBackground(.enabled(upThrough: .large))
        }
    }
}


#Preview {
    HomeView()
}
