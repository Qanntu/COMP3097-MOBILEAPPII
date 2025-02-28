//
//  ProjectViewModel.swift
//  HocusFocusApp
//
//  Created by liz arbieto on 2025-02-16.
//

import SwiftUI

class ProjectViewModel: ObservableObject {
    @Published var projects: [Project] = [
        Project(title: "Mobile App Wireframe", tasks: 21, dueDate: "21 March"),
        Project(title: "Mobile App MockUp", tasks: 10, dueDate: "21 March"),
        Project(title: "Backend", tasks: 2, dueDate: "21 March")
    ]
}

