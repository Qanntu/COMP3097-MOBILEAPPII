//
//  SplashView.swift
//  HocusFocusApp
//
//  Created by liz cruz
//  Student ID: 101470163

import SwiftUI

struct SplashView: View {
//  navigate to Sign in view
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
                    .foregroundColor(.orange)
                // Team members
                Text("By Liz Cruz Arbieto & Kaman Wong")
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                Spacer()
                
                Button(action: {
                    navigateToSignIn = true
                }) {
                    Text("Let's Start")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(red: 0.35, green: 0.30, blue: 0.62))
                        .foregroundColor(.yellow)
                        .cornerRadius(10)
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
struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
