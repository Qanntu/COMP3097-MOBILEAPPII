//
//  TaskDetailView.swift
//  HocusFocusApp
//
//  Created by liz arbieto on 2025-02-16.
//

import SwiftUI

struct TaskDetailView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Task Details")
                .font(.title2)
                .bold()
                .padding()
            
            Text("Mobile App Wireframe")
                .font(.title)
                .bold()
                .padding(.horizontal)
            
            HStack {
                Image(systemName: "calendar")
                Text("Due Date: 20 June")
            }
            .padding(.horizontal)
            .foregroundColor(.yellow)
            
            Text("Project Details")
                .font(.headline)
                .padding(.horizontal)
            Text("Lorem ipsum is simply dummy text of the printing and typesetting industry...")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.horizontal)
            
            Text("Project Progress")
                .font(.headline)
                .padding(.horizontal)
            
            List {
                TaskRow(title: "User Interviews", dueDate: "1 March")
                TaskRow(title: "Wireframes", dueDate: "21 March")
                TaskRow(title: "Icons", dueDate: "21 March")
                TaskRow(title: "Final Draft", dueDate: "21 March")
                TaskRow(title: "Meeting with", dueDate: "21 March")
                TaskRow(title: "Mobile Description", dueDate: "21 March")
            }
            
            Spacer()
            Button(action: {}) {
                Text("Add Task")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.yellow)
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

