//
//  HomeView.swift
//  HocusFocusApp
//
//  Created by liz arbieto on 2025-02-16.
//

import SwiftUI

struct HomeView: View {
    var userName: String
    var userId: String
    @StateObject private var viewModel = ProjectViewModel()
    @State private var showCreateProject = false  // Controls navigation

    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.35, green: 0.30, blue: 0.62)
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Welcome Back!")
                                .font(.caption)
                                .foregroundColor(.orange)
                            Text(userName)
                                .font(.title)
                                .foregroundColor(.orange)
                                .bold()
                        }
                        Spacer()
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                    .padding()

                    Text("Ongoing Projects")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(.leading)

                    ScrollView { // Scrolling for all projects
                        VStack(spacing: 8) { // Space between project rows
                            if viewModel.projects.isEmpty {
                                Text("No projects found")
                                    .foregroundColor(.gray)
                                    .padding()
                            } else {
                                ForEach(viewModel.projects) { project in  // Displaying projects in separate rows
                                    ProjectRow(title: project.title, tasks: project.tasks, dueDate: project.dueDate)
                                        .padding(.horizontal)
                                }
                            }
                        }
                    }

                    Spacer()

                    BottomTabBarProject(userId: userId, showCreateProject: $showCreateProject)
                }
                .onAppear {
                    viewModel.fetchProjects(userId: userId)
                }
            }
            .navigationDestination(isPresented: $showCreateProject) {
                CreateProjectView(userId: userId)
            }
        }
    }
}
