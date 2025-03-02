//
//  TaskDetailView.swift
//  HocusFocusApp
//
//  Created by liz arbieto on 2025-02-16.
//

import SwiftUI

struct TaskListView: View {
    @State private var showAlert = false
    @State private var navigateToCreateTask = false
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack{
            Color(red: 0.35, green: 0.30, blue: 0.62).edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                Text("Task List")
                    .font(.title2)
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                    .accessibilityIdentifier(/*@START_MENU_TOKEN@*/"Identifier"/*@END_MENU_TOKEN@*/)
                HStack{                Text("Mobile App Wireframe")
                        .font(.title)
                        .colorInvert()
                        .bold()
                        .padding(.horizontal)
                    Spacer()
                    Button(action: {showAlert = true}) {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                    }
                    .padding()
                    .buttonStyle(PlainButtonStyle())
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Delete Project"),
                            message: Text("Are you sure you want to delete this Project?"),
                            primaryButton: .destructive(Text("Delete")) {dismiss()},
                            secondaryButton: .cancel()
                        )
                    }
                }
            
                HStack {
                    Image(systemName: "calendar")
                    Text("Due Date: 20 June")
                }
                .padding(.horizontal)
                .foregroundColor(.yellow)
                
                Text("Project Details")
                    .colorInvert()
                    .font(.headline)
                    .padding(.horizontal)
                Text("Lorem ipsum is simply dummy text of the printing and typesetting industry...")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                
                Text("Project Progress")
                    .font(.headline)
                    .colorInvert()
                    .padding(.horizontal)
                
                List {
                    TaskRow(title: "User Interviews", dueDate: "1 March")
                    .listRowBackground(Color(red: 0.35, green: 0.30, blue: 0.62))
                                       
                    TaskRow(title: "Wireframes", dueDate: "21 March")
                    .listRowBackground(Color(red: 0.35, green: 0.30, blue: 0.62))

                    TaskRow(title: "Icons", dueDate: "21 March")
                    .listRowBackground(Color(red: 0.35, green: 0.30, blue: 0.62))
                    TaskRow(title: "Final Draft", dueDate: "21 March")
                    .listRowBackground(Color(red: 0.35, green: 0.30, blue: 0.62))
                    TaskRow(title: "Meeting with", dueDate: "21 March")
                    .listRowBackground(Color(red: 0.35, green: 0.30, blue: 0.62))
                    TaskRow(title: "Mobile Description", dueDate: "21 March")
                    .listRowBackground(Color(red: 0.35, green: 0.30, blue: 0.62))
                }
                .listStyle(PlainListStyle())
                Spacer()
                
                BottomTabBarTask()
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
