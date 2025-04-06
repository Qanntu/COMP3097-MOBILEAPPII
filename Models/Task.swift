//
//  Task.swift
//  HocusFocusApp
//
//  Created by liz cruz
//  Student ID: 101470163

import Foundation

struct Task: Identifiable, Codable {
    var id: String
    var title: String
    var dueDate: String
    var isCompleted: Bool
    var projectId: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title
        case dueDate = "dueDate"
        case isCompleted = "isCompleted"
        case projectId = "projectId"
    }
}
