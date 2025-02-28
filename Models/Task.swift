//
//  Task.swift
//  HocusFocusApp
//
//  Created by liz arbieto on 2025-02-16.
//

import Foundation

struct Task: Identifiable {
    var id = UUID()
    var title: String
    var dueDate: String
    var isCompleted: Bool
}

