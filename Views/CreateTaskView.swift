//
//  CreateTaskView.swift
//  HocusFocusApp
//
//  Created by liz arbieto on 2025-02-16.
//

import SwiftUI

struct CreateTaskView: View {
    
    @State private var title: String = ""
    @State private var dueDate: Date = Date()
    @State private var selectedProject: String = "project"
    
    var projectTitles = ["Mobile App Wireframe", "Mobile App MockUp", "Backend", "Frontend", "Design"]
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(alignment: .leading) {
            Form{
                Section {
                    Text("Create New Task")
                        .font(.title)
                        .bold()
                        .padding(.vertical)
                }
                .listRowBackground(Color.clear)
                
                Section(header: Text("Task Title").font(.headline)) {
                    TextField("Enter task title", text: $title)
                        .foregroundColor(.black)
                    
                }
                .listRowBackground(Color.white)
                
                Section(header: Text("Due Date").font(.headline)) {
                    HStack {
                        Image(systemName: "calendar")
                        Spacer()
                        DatePicker("", selection: $dueDate, displayedComponents: [.date])
                            .colorInvert()
                            .labelsHidden()
                    }
                    
                }
                .listRowBackground(Color
                    .gray
                    .opacity(0.9))
                
                Section(header: Text("Project").font(.headline)) {
                    Picker("", selection: $selectedProject) {
                        ForEach(projectTitles, id: \.self) { project in Text(project)
                                .tag(project)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .tint(.white)
                    
                }
                .listRowBackground(Color.gray.opacity(0.9))
                    
                Section {
                    Button(action: { dismiss() }) {
                        Text("Create")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.black)
                            .padding(8)
                            .cornerRadius(10)
                        
                    }
                }
                .listRowBackground(Color.yellow)
            }
                .scrollContentBackground(.hidden)

        }
        .padding()
        .foregroundColor(.white)
        .background(Color(red: 0.35, green: 0.30, blue: 0.62))
    }
}

struct CreateTaskView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTaskView()
    }
}
