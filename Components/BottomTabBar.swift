//
//  BottomTabBar.swift
//  HocusFocusApp
//
//  Created by liz arbieto on 2025-02-16.
//

import SwiftUI

struct BottomTabBar: View {
    @State private var navigateToHome = false
    @State private var navigateToCreateProject = false

    @State private var userName = ""

    var body: some View {
        
        HStack {
            Button(action: {navigateToHome = true}) {
                VStack {
                    Image(systemName: "house")
                    Text("Home")
                        .font(.caption)
                }
            }
            .frame(maxWidth: .infinity)
            .navigationDestination(isPresented:$navigateToHome){ HomeView(userName: userName)
            }
            
            Button(action: {navigateToCreateProject = true}) {
                VStack {
                    Image(systemName: "plus.circle.fill")
                        .font(.largeTitle)
                }
            }
            .frame(maxWidth: .infinity)
            .navigationDestination(isPresented:$navigateToCreateProject){ CreateProjectView()
            }
            
            Button(action: {}) {
                VStack {
                    Image(systemName: "bell")
                    Text("Notifications")
                        .font(.caption)
                }
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
        .foregroundColor(.gray)
        .background(Color(red: 0.15, green: 0.18, blue: 0.20))
    }
}
