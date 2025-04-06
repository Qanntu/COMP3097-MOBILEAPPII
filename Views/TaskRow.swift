//
//  TaskRow.swift
//  HocusFocusApp
//
//  Created by liz cruz
//  Student ID: 101470163

// Here we configurate list of task
import SwiftUI


struct TaskRow: View {
    @State private var showAlert = false
    @State private var errorMessage = ""
    
    var task: Task
    var taskViewModel: TaskViewModel

    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "checkmark.circle")
                .foregroundColor(.yellow)
            
            VStack(alignment: .leading) {
                Text(task.title)
                    .font(.headline)
                    .foregroundColor(.white)
                Text("Due on: \(task.dueDate)")
                    .font(.subheadline)
                    .foregroundColor(.yellow)
            }
            Spacer()
            
            Button(action: { showAlert = true }) {
                Image(systemName: "trash")
                    .foregroundColor(.red)
            }
            .buttonStyle(PlainButtonStyle())
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Delete Task"),
                    message: Text("Are you sure you want to delete this task?"),
                    primaryButton: .destructive(Text("Delete")) {
                        deleteTask()  // call delete function afer user confirmation
                    },
                    secondaryButton: .cancel()
                )
            }
        }
        .padding()
        .background(Color(red: 0.28, green: 0.33, blue: 0.35))
        .cornerRadius(8)
    }
    
    func deleteTask() {
        taskViewModel.deleteTask(taskId: task.id, projectId: task.projectId) {
        }
    }
}
