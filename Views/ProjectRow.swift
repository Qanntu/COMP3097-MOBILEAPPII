//
//  ProjectRow.swift
//  HocusFocusApp
//
//  Created by liz arbieto on 2025-02-16.
//

import SwiftUI

struct ProjectRow: View {
    var title: String
    var tasks: Int
    var dueDate: String
    
    var body: some View {
        NavigationLink(destination: TaskListView()) {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text("Next task due 1 March")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text("Due on: \(dueDate)")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            Spacer()
            Text("\(tasks) Tasks")
                .font(.caption)
                .foregroundColor(.yellow)
        }
    }
}

