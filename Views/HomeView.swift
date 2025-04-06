//
//  HomeView.swift
//  HocusFocusApp
//
//  Created by liz arbieto - Student ID: 101470163.
//  Created by Kaman - Student ID: 101424041.

import SwiftUI

struct HomeView: View {
    var userName: String
    var userId: String
    @StateObject private var viewModel = ProjectViewModel()
    @StateObject private var taskViewModel = TaskViewModel()
    @State private var showCreateProject = false

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

                        //  logout botton
                        VStack(spacing: 4) {
                            Button(action: {
                                logout()
                            }) {
                                Image(systemName: "arrow.backward.circle.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.red)
                            }
                            Text("Logout")
                                .font(.caption2)
                                .foregroundColor(.white)
                        }
                    }
                    .padding()

                    Text("Ongoing Projects")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(.leading)

                    ScrollView {
                        VStack(spacing: 8) {
                            if viewModel.projects.isEmpty {
                                Text("No projects found")
                                    .foregroundColor(.gray)
                                    .padding()
                            } else {
                                // project list
                                ForEach(viewModel.projects) { project in
                                    ProjectRow(project: project, projectViewModel: viewModel)
                                        .padding(.horizontal)
                                }
                            }
                        }
                    }

                    Spacer()
                    
//                  create project page
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

    // function to go SignInView
    func logout() {
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = scene.windows.first else {
            return
        }

        let signInView = SignInView()
        let hostingController = UIHostingController(rootView: signInView)
        window.rootViewController = hostingController
        window.makeKeyAndVisible()
    }
}
