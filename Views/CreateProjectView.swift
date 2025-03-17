//
//  CreateProjectView.swift
//  HocusFocusApp
//
//  Created by Kaman on 2025-03-01.
//

import SwiftUI

struct CreateProjectView: View {
    var userId: String // ID that creates the project
    @State private var title: String = ""
    @State private var details: String = "Enter details here..."
    @State private var dueDate: Date = Date()
    @State private var errorMessage = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            Form {
                Section {
                    Text("Create New Project")
                        .font(.title)
                        .bold()
                        .padding(.vertical)
                }
                
                Section(header: Text("Project Title").font(.headline)) {
                    TextField("Enter project title", text: $title)
                        .foregroundColor(.black)
                }
                
                Section(header: Text("Project Details").font(.headline)) {
                    TextEditor(text: $details)
                        .foregroundColor(.black)
                        .frame(height: 100)
                }
                
                Section(header: Text("Due Date").font(.headline)) {
                    DatePicker("", selection: $dueDate, displayedComponents: [.date, .hourAndMinute])
                        .labelsHidden()
                }
                
                Section {
                    Button(action: createProject) {
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
    
    // Method that sends project data to backend
    func createProject() {
        guard let url = URL(string: "http://localhost:5000/api/projects/create") else {
            DispatchQueue.main.async {
                self.errorMessage = "Invalid server URL"
            }
            return
        }

        let formatter = ISO8601DateFormatter()
        let formattedDate = formatter.string(from: dueDate)

        let body: [String: Any] = [
            "title": title,
            "details": details,
            "dueDate": formattedDate,
            "createdBy": userId
        ]

        guard let jsonData = try? JSONSerialization.data(withJSONObject: body) else {
            DispatchQueue.main.async {
                self.errorMessage = "Failed to encode project data"
            }
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = error {
                DispatchQueue.main.async {
                    self.errorMessage = "Network error. Please try again."
                }
                return
            }

            DispatchQueue.main.async {
                self.dismiss()
            }
        }.resume()
    }
}
