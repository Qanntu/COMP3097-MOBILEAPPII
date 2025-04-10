//
//  TaskDetailView.swift
//  HocusFocusApp
//
//  Created by liz arbieto on 2025-02-16.
//  Student ID: 101470163

import SwiftUI


struct TaskListView: View {
    var project: Project
    @ObservedObject var taskViewModel: TaskViewModel
    // dismiss the current view, form AI
    @Environment(\.dismiss) var dismiss
    @State private var showAlert = false

    func fetchTasks() {
        taskViewModel.fetchTasks(projectId: project.id)
    }

    var body: some View {
        ZStack {
            Color(red: 0.35, green: 0.30, blue: 0.62).edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                Text("Task List")
                    .font(.title2)
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                
                // project title
                HStack {
                    Text(project.title)
                        .font(.title)
                        .colorInvert()
                        .bold()
                        .padding(.horizontal)
                    
                    Spacer()

                }
                
                // due date
                HStack {
                    Image(systemName: "calendar")
                    Text("Due Date: \(formatDate(from: project.dueDate))")
                }
                .padding(.horizontal)
                .foregroundColor(.yellow)
                
                // project details
                Text("Project Details")
                    .colorInvert()
                    .font(.headline)
                    .padding(.horizontal)
                
                Text(project.details)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                
                // progress
                Text("Project Progress")
                    .font(.headline)
                    .colorInvert()
                    .padding(.horizontal)
                
                // List of tasks
                List(taskViewModel.tasks) { task in
                    TaskRow(task: task, taskViewModel: taskViewModel)
                        .listRowBackground(Color(red: 0.35, green: 0.30, blue: 0.62))
                        .swipeActions {
                            
                            Button(action: {                                taskViewModel.toggleCompletion(taskId: task.id, isCompleted: !task.isCompleted)
                                    fetchTasks()
                            }) {
                                Label("Complete", systemImage: "checkmark.circle")
                            }
                            .tint(.green)
                        }
                }.background(Color(red: 0.35, green: 0.30, blue: 0.62))
                .listStyle(PlainListStyle())
                
                Spacer()
                
//              create task page
                BottomTabBarTask(
                    taskViewModel: taskViewModel,
                    projectId: project.id,
                    projectName: project.title
                )
            }
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                fetchTasks()
            }
        }
    }

    // date
    func formatDate(from isoDate: String) -> String {
        let isoFormatter = ISO8601DateFormatter()
        if let date = isoFormatter.date(from: isoDate) {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: date)
        }
        return isoDate
    }
}
