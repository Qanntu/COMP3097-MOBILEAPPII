//
//  UserStorage.swift
//  HocusFocusApp
//
//  Created by liz arbieto on 2025-02-16.
//

import Foundation

class UserStorage: ObservableObject {
    @Published var users: [User] = []
    private let fileName = "users.txt"

    init() {
        loadUsers()
    }

    private var fileURL: URL {
        let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return directory.appendingPathComponent(fileName)
    }

    func saveUsers() {
        do {
            let data = try JSONEncoder().encode(users)
            try data.write(to: fileURL)
            print("Users saved successfully!")
        } catch {
            print("Error saving users: \(error.localizedDescription)")
        }
    }

    func loadUsers() {
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: fileURL.path) {
            do {
                let data = try Data(contentsOf: fileURL)
                users = try JSONDecoder().decode([User].self, from: data)
                print("Users loaded successfully!")
            } catch {
                print("Error decoding user data: \(error.localizedDescription)")
            }
        } else {
            print("ℹ️ No users file found. Creating a new one...")
            saveUsers()
        }
    }


    func addUser(name: String, email: String, password: String) {
        let newUser = User(name: name, email: email, password: password)
        users.append(newUser)
        saveUsers()
    }
}
