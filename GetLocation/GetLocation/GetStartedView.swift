//
//  GetStartedView.swift
//  GetLocation
//
//  Created by Makape Tema on 2024/08/01.
//

import SwiftUI

struct GetStartedView: View {
    var body: some View {
        HStack(content: {
            Image(systemName: "pencil.and.list.clipboard")
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                
        })
        
       Spacer()
        
        VStack {
            Text("Get Started")
                .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
            Spacer()
            
            VStack {
                Button(action: {
                    // Handle
                }) {
                    Text("Get Started")
                        .bold()
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.yellow)
                        .cornerRadius(25)
                }
                .frame(width: 350)
            }
        }
        Spacer()
    }
}

#Preview {
    GetStartedView()
}
