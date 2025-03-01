//
//  TaskDetailView.swift
//  HocusFocusApp
//
//  Created by liz arbieto on 2025-02-16.
//

import SwiftUI

struct TaskListView: View {
    @State private var navigateToCreateTask = false

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
                
                Text("Mobile App Wireframe")
                    .font(.title)
                    .colorInvert()
                    .bold()
                    .padding(.horizontal)
                
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
                    TaskRow(title: "Wireframes", dueDate: "21 March")
                    TaskRow(title: "Icons", dueDate: "21 March")
                    TaskRow(title: "Final Draft", dueDate: "21 March")
                    TaskRow(title: "Meeting with", dueDate: "21 March")
                    TaskRow(title: "Mobile Description", dueDate: "21 March")
                }
                
                Spacer()
                Button(action: {navigateToCreateTask = true}) {
                    Text("Add Task")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.yellow)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .padding()
                }.navigationDestination(isPresented:$navigateToCreateTask){
                    CreateTaskView()
                }
                
                BottomTabBar()
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
