//
//  TaskRow.swift
//  HocusFocusApp
//
//  Created by liz arbieto on 2025-02-16.
//

import SwiftUI

struct TaskRow: View {
    @State private var navigateToEditTask = false

    var title: String
    var dueDate: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text("Due on: \(dueDate)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            Image(systemName: "checkmark.circle")
                .foregroundColor(.yellow)
        }
    }
}

