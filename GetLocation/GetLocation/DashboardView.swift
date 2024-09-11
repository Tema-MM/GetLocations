//
//  DashboardView.swift
//  GetLocation
//
//  Created by Makape Tema on 2024/08/02.
//

import SwiftUI

struct DashboardView: View {
    @State var presentView = false
    
    var body: some View {
        VStack {
            Spacer() // Pushes content to the center vertically
            
            // Image in the center
            Image(systemName: "star.fill") // Replace with your custom image
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .foregroundColor(.blue) // Customize the color if needed
            
            Spacer() // Pushes the image upwards, leaving space for the button at the bottom
            
            // "Get Started" button at the bottom
            Button(action: {
                // Action to perform when button is tapped
                self.presentView.toggle()
                print("Get Started button tapped")
            }) {
                Text("Get Started")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
            }.sheet(isPresented: $presentView) {
                ContentView()
            }
            .padding(.bottom, 40) // Adds some spacing at the bottom
        }
        .edgesIgnoringSafeArea(.all) // Makes the background fill the whole screen
        .background(Color(.systemBackground)) // Background color of the view
    }
}

#Preview {
    DashboardView()
}
