//
//  CreateTaskView.swift
//  HocusFocusApp
//
//  Created by liz arbieto on 2025-02-16.
//

import SwiftUI

struct CreateTaskView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Create New Task")
                .font(.title)
                .bold()
                .padding()
            
            TextField("Task Title", text: .constant(""))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Text("Task Details")
                .font(.headline)
                .padding(.horizontal)
            
            TextEditor(text: .constant("Enter details here..."))
                .frame(height: 100)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
            
            HStack {
                Image(systemName: "clock")
                Text("10:30 AM")
                Spacer()
                Image(systemName: "calendar")
                Text("15/11/2025")
            }
            .padding()
            
            Button(action: {}) {
                Text("Create")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.yellow)
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .padding()
            }
        }
        .padding()
    }
}

