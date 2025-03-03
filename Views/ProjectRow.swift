//
//  ProjectRow.swift
//  HocusFocusApp
//
//  Created by liz arbieto on 2025-02-16.
//

//Here we set list of projects or categories.
import SwiftUI

struct ProjectRow: View {
    var title: String
    var tasks: Int
    var dueDate: String
    
    var body: some View {
        NavigationLink(destination: TaskListView()) {
            HStack{
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.headline)
                    Text("Next task due 1 March")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Spacer()
                    
                    Text("Due on: \(dueDate)")
                        .font(.footnote)
                }
                Spacer()
                
                Text("\(tasks) Tasks")
                    .font(.caption)
                    .foregroundColor(.yellow)
            }
        }
        .padding()
        .foregroundColor(.white)
    }
}

