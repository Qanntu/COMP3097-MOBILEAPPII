//
//  CreateTaskView.swift
//  HocusFocusApp
//
//  Created by liz arbieto on 2025-02-16.
//  Student ID: 101470163

import SwiftUI

struct CreateTaskView: View {
    @State private var title: String = ""
    @State private var dueDate: Date = Date()
    @State private var errorMessage: String = ""
    
    @Environment(\.dismiss) var dismiss

    @ObservedObject var taskViewModel: TaskViewModel
    var projectId: String
    var projectName: String

    var body: some View {
        VStack(alignment: .leading) {
            Form {
                Section {
                    Text("Create New Task")
                        .font(.title)
                        .bold()
                        .padding(.vertical)
                }
                
                Section(header: Text("Task Title").font(.headline)) {
                    TextField("Enter task title", text: $title)
                        .foregroundColor(.black)
                }
                
                Section(header: Text("Due Date").font(.headline)) {
                    DatePicker("", selection: $dueDate, displayedComponents: [.date, .hourAndMinute])
                        .labelsHidden()
                }

                Section(header: Text(" Project").font(.headline)) {
                    Text("\(projectName)")
                }

                if !errorMessage.isEmpty {
                    Section {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .font(.caption)
                    }
                }

                Section {
                    Button( action: {createTask(projectId: projectId)}
                    ) {
                        Text("Create")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.black)
                            .padding(8)
                            .cornerRadius(10)
                    }
                }
                .listRowBackground(Color.yellow)
            }
        }
        .padding()
        .background(Color(red: 0.35, green: 0.30, blue: 0.62))
        }

func createTask(projectId: String) {
        guard let url = URL(string: "http://localhost:5000/api/tasks/create") else { return }

        let formatter = ISO8601DateFormatter()
    let formattedDate = formatter.string(from: dueDate)

        let body: [String: Any] = [
            "projectId": projectId,
            "title": title,
            "dueDate": formattedDate, // iso format, matching backend
        ]

        guard let jsonData = try? JSONSerialization.data(withJSONObject: body) else { return }
// call backend function
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData

//   error handle
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.errorMessage = "Failed to create task: \(error.localizedDescription)"
                }
                return
            }

            guard let data = data else {
                DispatchQueue.main.async {
                    self.errorMessage = "No data received"
                }
                return
            }

            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 201 {
                DispatchQueue.main.async {
                    self.dismiss()
                    taskViewModel.fetchTasks(projectId: projectId)
                }
            } else {
                DispatchQueue.main.async {
                    self.errorMessage = "Failed to create task. Server error."
                }
            }
        }.resume()
    }
}
