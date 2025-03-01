//
//  CreateTaskView.swift
//  HocusFocusApp
//
//  Created by liz arbieto on 2025-02-16.
//

import SwiftUI

struct CreateTaskView: View {
    @State private var navigateToTaskList = false
    
    @State private var title: String = ""
    @State private var dueDate: Date = Date()
    @State private var selectedProject: String = "project"
    
    var projectTitles = ["Mobile App Wireframe", "Mobile App MockUp", "Backend", "Frontend", "Design"]
    
    var body: some View {
        ZStack{
            Color(red: 0.35, green: 0.30, blue: 0.62).edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                
                Text("Create New Task")
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                
                Text("Task Title")
                    .font(.headline)
                    .colorInvert()
                    .padding(.horizontal)
                
                TextField("Task Title", text: .constant(""))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Text("Task Details")
                    .font(.headline)
                    .colorInvert()
                    .padding(.horizontal)
                
                TextEditor(text: .constant("Enter details here..."))
                    .frame(height: 100)
                    .padding(3)
                    .border(/*@START_MENU_TOKEN@*/Color.orange/*@END_MENU_TOKEN@*/, width: 3.5)
                    .cornerRadius(10)
                
                Text("Due Date")
                    .font(.headline)
                    .colorInvert()
                    .padding(.horizontal)
                
                HStack {
                    Image(systemName: "calendar")
                    Image(systemName: "clock")
                    Spacer()
                    DatePicker("", selection: $dueDate, displayedComponents: [.date, .hourAndMinute])
                        .colorInvert()
                        .background(Color.gray)
                }
                .padding()
                
                HStack(){
                    Text("Project: ")
                        .font(.body)
                        .colorInvert()
                        .bold()
                        .padding()
                    Picker("Project:", selection: $selectedProject){
                        ForEach(projectTitles, id: \.self){
                            project in Text(project).tag(project).foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .foregroundColor(.white)
                    
                    
                }
                .background(.gray)
                .border(.white)
                .cornerRadius(10)
                .padding()
                
                Button(action: {navigateToTaskList = true}) {
                    Text("Create")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.yellow)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .padding()
                }.navigationDestination(isPresented: $navigateToTaskList) {
                    TaskListView()
                }
            }
            .padding()
        }
    }
}

struct CreateTaskView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTaskView()
    }
}
