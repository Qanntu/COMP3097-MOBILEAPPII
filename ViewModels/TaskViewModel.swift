//
//  TaskViewModel.swift
//  HocusFocusApp
//
//  Created by liz arbieto on 2025-02-16.
//

import SwiftUI

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = [
        Task(title: "User Interviews", dueDate: "1 March", isCompleted: false),
        Task(title: "Wireframes", dueDate: "21 March", isCompleted: false)
    ]
}
