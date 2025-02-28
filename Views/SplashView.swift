//
//  SplashView.swift
//  HocusFocusApp
//
//  Created by liz arbieto on 2025-02-16.
//

import SwiftUI

struct SplashView: View {
    @State private var navigateToSignIn = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Image(systemName: "book.circle")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding()
                
                Text("HOCUS FOCUS")
                    .font(.largeTitle)
                    .bold()
                
                Text("Make magic with your time")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Spacer()
                
                Button(action: {
                    navigateToSignIn = true
                }) {
                    Text("Let's Start")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.purple, lineWidth: 3)
                        )
                }
                .padding()
                .navigationDestination(isPresented: $navigateToSignIn) {
                    SignInView()
                }
            }
            .padding()
        }
    }
}



