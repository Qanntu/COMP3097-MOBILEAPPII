//
//  TaskRow.swift
//  HocusFocusApp
//
//  Created by liz arbieto on 2025-02-16.
//

import SwiftUI

struct TaskRow: View {
    @State private var showAlert = false
    @State private var navigateToEditTask = false

    var title: String
    var dueDate: String
    
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
                .foregroundColor(.yellow)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                Text("Due on: \(dueDate)")
                    .font(.subheadline)
                    .foregroundColor(.yellow)
            }
            Spacer()
            
            Button(action: {showAlert = true}) {
                Image(systemName: "trash")
                    .foregroundColor(.red)
            }
            .buttonStyle(PlainButtonStyle())
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Delete Task"),
                    message: Text("Are you sure you want to delete this task?"),
                    primaryButton: .destructive(Text("Delete")) {},
                    secondaryButton: .cancel()
                )
            }
        }
        .padding()
        .background(Color(red: 0.28, green: 0.33, blue: 0.35))
        .cornerRadius(8)
    }
}
