//
//  Project.swift
//  HocusFocusApp
//
//  Created by Kaman
//  Student ID: 101424041

import Foundation

struct Project: Identifiable, Codable {
    var id: String
    var title: String
    var details: String
    var tasks: [Task]
    var dueDate: String
    var createdBy: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title
        case details
        case tasks
        case dueDate
        case createdBy
    }
}
