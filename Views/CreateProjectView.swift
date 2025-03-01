//
//  CreateProjectView.swift
//  HocusFocusApp
//
//  Created by Nyl on 2025-03-01.
//

import SwiftUI

struct CreateProjectView: View {
    @State private var title: String = ""
    @State private var dueDate: Date = Date()
    @State private var navigateToTaskList = false
    
    var body: some View {
        ZStack{
            Color(red: 0.35, green: 0.30, blue: 0.62).edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                Text("Create New Project")
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                
                Text("Project Title")
                    .font(.headline)
                    .colorInvert()
                    .padding(.horizontal)
                
                TextField("Project Title", text: .constant(""))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Text("Project Details")
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
                        .foregroundColor(.white)

                    Image(systemName: "clock")
                        .foregroundColor(.white)
                    Spacer()
                    
                    DatePicker("", selection: $dueDate, displayedComponents: [.date, .hourAndMinute])
                        .colorInvert()
                        .background(Color.gray)
                }
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

struct CreateProjectView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProjectView()
    }
}
