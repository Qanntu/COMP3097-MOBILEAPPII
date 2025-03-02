//
//  BottomTabBar.swift
//  HocusFocusApp
//
//  Created by liz arbieto on 2025-02-16.
//

import SwiftUI

struct BottomTabBarProject: View {
    @State private var navigateToCreateProject = false
    var body: some View {
        
        HStack {
            Button(action: {navigateToCreateProject = true}) {
                VStack {
                    Image(systemName: "plus.circle.fill")
                        .font(.largeTitle)
                }
            }
            .frame(maxWidth: .infinity)
            .navigationDestination(isPresented:$navigateToCreateProject){ CreateProjectView()
            }
        }
        .padding()
        .foregroundColor(.gray)
        .background(Color(red: 0.15, green: 0.18, blue: 0.20))
    }
}
