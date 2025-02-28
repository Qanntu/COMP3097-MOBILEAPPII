//
//  Project.swift
//  HocusFocusApp
//
//  Created by liz arbieto on 2025-02-16.
//

import Foundation

struct Project: Identifiable {
    var id = UUID()
    var title: String
    var tasks: Int
    var dueDate: String
}

