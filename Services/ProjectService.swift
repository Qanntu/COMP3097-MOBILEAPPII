//
//  ProjectService.swift
//  HocusFocusApp
//
//  Created by liz arbieto on 2025-04-04.
//

import Foundation

struct ProjectService {
    static func createProject(
        title: String,
        details: String,
        dueDate: String,
        createdBy: String,
        completion: @escaping (Result<[String: Any], Error>) -> Void
    ) {
        guard let url = URL(string: "http://192.168.1.5:5000/api/projects/create") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let body: [String: Any] = [
            "title": title,
            "details": details,
            "dueDate": dueDate,
            "createdBy": createdBy
        ]

        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 0)))
                return
            }

            do {
                if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
                    completion(.success(json))
                }
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()
    }
}

