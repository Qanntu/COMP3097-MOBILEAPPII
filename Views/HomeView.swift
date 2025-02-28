//
//  HomeView.swift
//  HocusFocusApp
//
//  Created by liz arbieto on 2025-02-16.
//

import SwiftUI

struct HomeView: View {
    var userName: String // Se recibe el nombre del usuario desde SignInView
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Welcome Back!")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text(userName)
                            .font(.title)
                            .bold()
                    }
                    Spacer()
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
                .padding()

                Text("Ongoing Projects")
                    .font(.headline)
                    .padding(.leading)

                List {
                    ProjectRow(title: "Mobile App Wireframe", tasks: 21, dueDate: "21 March")
                    ProjectRow(title: "Mobile App MockUp", tasks: 10, dueDate: "21 March")
                    ProjectRow(title: "Backend", tasks: 2, dueDate: "21 March")
                    ProjectRow(title: "Frontend", tasks: 2, dueDate: "21 March")
                    ProjectRow(title: "Design", tasks: 2, dueDate: "21 March")
                }
            }
            .navigationBarHidden(true)
        }
    }
}

