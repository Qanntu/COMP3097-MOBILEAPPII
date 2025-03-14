//
//  ProjectViewModel.swift
//  HocusFocusApp
//
//  Created by liz arbieto on 2025-02-16.
//

import SwiftUI

class ProjectViewModel: ObservableObject {
    @Published var projects: [Project] = []//to show array of projects

    func fetchProjects(userId: String) {
        guard let url = URL(string: "http://localhost:5000/api/projects/\(userId)") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if error != nil {
                return
            }
            guard let data = data else {
                return
            }
            do {
                let decodedProjects = try JSONDecoder().decode([Project].self, from: data)
                DispatchQueue.main.async {
                    self.projects = decodedProjects // Update list of projects
                }
            } catch {
                return
            }
        }.resume()
    }
}
