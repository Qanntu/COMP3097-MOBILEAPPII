//
//  ProjectRow.swift
//  HocusFocusApp
//
//  Created by Kaman
//  Student ID: 101424041

//Here we set list of projects or categories.
import SwiftUI
import SwiftUI

struct ProjectRow: View {
    var project: Project
    @ObservedObject var projectViewModel: ProjectViewModel

    var body: some View {
        VStack {
            HStack {
                NavigationLink(destination: TaskListView(project: project, taskViewModel: TaskViewModel())) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(project.title)
                            .font(.headline)
                        
                        Text("Next task due \(nextTaskDueDate())")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        Text("Due on: \(project.dueDate)")
                            .font(.footnote)
                        
                        HStack {
                            Spacer()
                            Text("\(project.tasks.count) Tasks")
                                .font(.caption)
                                .foregroundColor(.yellow)
                        }
                    }
                    .padding()
                    .background(Color(red: 0.27, green: 0.353, blue: 0.392))
                    .cornerRadius(10)
                }
                .padding(.vertical, 3)
                .foregroundColor(.white)

                Button(action: {
                    projectViewModel.deleteProject(projectId: project.id) {
                        projectViewModel.projects.removeAll { $0.id == project.id }
                    }
                }) {
                    Image(systemName: "trash")
                        .foregroundColor(.red)
                }
                .padding()
            }
        }
    }

    func nextTaskDueDate() -> String {
        let isoFormatter = ISO8601DateFormatter()
        let displayFormatter = DateFormatter()
        displayFormatter.dateStyle = .medium

        let upcomingDates = project.tasks
            .filter { !$0.isCompleted }
            .compactMap { isoFormatter.date(from: $0.dueDate) }
            .sorted()

        if let nextDate = upcomingDates.first {
            return displayFormatter.string(from: nextDate)
        } else {
            return "N/A"
        }
    }
}
