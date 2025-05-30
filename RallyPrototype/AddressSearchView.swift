//
//  AddressSearchView.swift
//  RallyPrototype
//
//  Created by Mansib Waiz on 2025-05-30.
//

import SwiftUI

struct AddressSearchView: View {
    @State private var startLocationText = ""
    @State private var endLocationText = ""
    
    var body: some View {
        VStack {
            //header view
            HStack {
                VStack{
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 6, height: 6)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 24)
                    
                    Rectangle()
                        .fill(.black)
                        .frame(width: 6, height: 6)
                }
                
                VStack {
                    TextField("Current Location", text: $startLocationText)
                        .frame(height: 32)
                        .background(Color(.systemGroupedBackground))
                        .padding(.trailing)
                    
                    TextField("Where To?", text: $endLocationText)
                        .frame(height: 32)
                        .background(Color(.systemGray4))
                        .padding(.trailing)
                }
                
            }
            .padding(.horizontal)
            
            //list view
            ScrollView {
                VStack (alignment: .leading) {
                    ForEach(0 ..< 20, id: \.self) { _ in
                        
                    }
                }
                
            }
        }
    }
}

#Preview {
    AddressSearchView()
}
