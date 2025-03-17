//
//  Project.swift
//  HocusFocusApp
//
//  Created by liz arbieto on 2025-02-16.
//

import Foundation

struct Project: Identifiable, Codable {
    var id: String
    var title: String
    var details: String
    var tasks: Int
    var dueDate: String
    var createdBy: String
    
    //_id for mongodb
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title
        case details
        case tasks
        case dueDate
        case createdBy}
}

