//
//  TaskViewModel.swift
//  HocusFocusApp
//
//  Created by liz cruz
//  Student ID: 101470163
//

import SwiftUI
import Foundation


class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []

    // get all tasks of the project
    func fetchTasks(projectId: String) {
        guard let url = URL(string: "http://localhost:5000/api/tasks/project/\(projectId)") else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }

            do {
                let decoded = try JSONDecoder().decode([Task].self, from: data)
                DispatchQueue.main.async {
                    self.tasks = decoded
                }
            } catch {
                print("Decoding error: \(error.localizedDescription)")
            }
        }.resume()
    }

    // Crear una nueva tarea
    func createTask(title: String, dueDate: String, projectId: String, completion: @escaping () -> Void) {
        guard let url = URL(string: "http://localhost:5000/api/tasks/create") else { return }

        let body: [String: Any] = [
            "title": title,
            "dueDate": dueDate,
            "projectId": projectId
        ]

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        URLSession.shared.dataTask(with: request) { data, _, error in
            guard error == nil else { return }
            DispatchQueue.main.async {
                completion()
            }
        }.resume()
    }

    // check task as completed
    func toggleCompletion(taskId: String, isCompleted: Bool) {
        guard let url = URL(string: "http://localhost:5000/api/tasks/\(taskId)/complete") else { return }

        let body: [String: Any] = [
            "isCompleted": isCompleted
        ]

        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        URLSession.shared.dataTask(with: request) { _, _, error in
            if let error = error {
                print("Toggle completion error: \(error.localizedDescription)")
            }
        }.resume()
    }

    // remove task
    func deleteTask(taskId: String, projectId: String, completion: @escaping () -> Void) {
        guard let url = URL(string: "http://localhost:5000/api/tasks/\(taskId)") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"

        URLSession.shared.dataTask(with: request) { _, _, error in
            if let error = error {
                print("Failed to delete task: \(error.localizedDescription)")
                return
            }

            // after removing , update list
            DispatchQueue.main.async {
                self.fetchTasks(projectId: projectId)
                completion()
            }
        }.resume()
    }
}
