//
//  BottomTabBarTask.swift
//  HocusFocusApp
//
//  Created by Kaman on 2025-03-01.
//

import SwiftUI

struct BottomTabBarTask: View {
    @State private var navigateToCreateTask = false

    var body: some View {
        
        HStack {
            Button(action: {navigateToCreateTask = true}) {
                VStack {
                    Image(systemName: "plus.circle.fill")
                        .font(.largeTitle)
                }
            }
            .frame(maxWidth: .infinity)
            .navigationDestination(isPresented:$navigateToCreateTask){ CreateTaskView()
            }
        }
        .padding()
        .foregroundColor(.gray)
        .background(Color(red: 0.15, green: 0.18, blue: 0.20))
    }
}

