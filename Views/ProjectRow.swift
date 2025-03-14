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
            VStack(alignment: .leading, spacing: 5) { // ✅ Use VStack to structure the content
                Text(title)
                    .font(.headline)
                
                Text("Next task due 1 March")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Spacer()
                
                Text("Due on: \(dueDate)")
                    .font(.footnote)
                
                HStack {
                    Spacer()
                    Text("\(tasks) Tasks")
                        .font(.caption)
                        .foregroundColor(.yellow)
                }
            }
            .padding()
            .background(Color(red: 0.27, green: 0.353, blue: 0.392)) // color for each project
            .cornerRadius(10) //rounded corners
        }
        .padding(.vertical, 3)  //space between projects
        .foregroundColor(.white)
    }
}
