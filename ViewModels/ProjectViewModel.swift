//
//  ProjectViewModel.swift
//  HocusFocusApp
//
//  Created by Kaman
//  Student ID: 101424041

import SwiftUI

class ProjectViewModel: ObservableObject {

    @Published var projects: [Project] = [] //project list

    //get projects by user
    func fetchProjects(userId: String) {
        guard let url = URL(string: "http://localhost:5000/api/projects/\(userId)") else {
            print("Invalid URL")
            return
        }
        
        // used for making network requests, form IA
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching projects: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let decodedProjects = try decoder.decode([Project].self, from: data)
                
                DispatchQueue.main.async {
                    self.projects = decodedProjects
                }
            } catch {
                print("Error decoding projects: \(error)")
            }
        }.resume()
    }

    //function to delete project
    func deleteProject(projectId: String, completion: @escaping () -> Void) {
        guard let url = URL(string: "http://localhost:5000/api/projects/\(projectId)") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"

        URLSession.shared.dataTask(with: request) { _, _, error in
            if let error = error {
                DispatchQueue.main.async {
                    print("Error deleting project: \(error.localizedDescription)")
                }
                return
            }

            DispatchQueue.main.async {
                //update list with completion
                completion()
            }
        }.resume()
    }
}
