//
//  BottomTabBarTask.swift
//  HocusFocusApp
//
//  Created by Kaman
//  Student ID: 101424041
//

import SwiftUI

struct BottomTabBarTask: View {
    @State private var navigateToCreateTask = false

    var taskViewModel: TaskViewModel
    var projectId: String
    var projectName: String
    
    var body: some View {
        HStack {
            Button(action: {
                navigateToCreateTask = true
            }) {
                VStack {
                    Image(systemName: "plus.circle.fill")
                        .font(.largeTitle)
                }
            }
            .frame(maxWidth: .infinity)
            .navigationDestination(isPresented: $navigateToCreateTask) {
                CreateTaskView(
                    taskViewModel: taskViewModel,
                    projectId: projectId,
                    projectName: projectName
                )
            }
        }
        .padding()
        .foregroundColor(.gray)
        .background(Color(red: 0.15, green: 0.18, blue: 0.20))
    }
}
