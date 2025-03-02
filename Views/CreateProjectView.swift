//
//  CreateProjectView.swift
//  HocusFocusApp
//
//  Created by Nyl on 2025-03-01.
//

import SwiftUI

struct CreateProjectView: View {
    @State private var title: String = ""
    @State private var datails: String = "Enter details here..."
    @State private var dueDate: Date = Date()
    
    @Environment(\.dismiss) var dismiss
    var body: some View {            VStack(alignment: .leading) {
            Form{
                Section {
                    Text("Create New Project")
                        .font(.title)
                        .bold()
                        .padding(.vertical)
                }
                .listRowBackground(Color.clear)
                
                Section(header: Text("Project Title").font(.headline)) {
                    TextField("Enter project title", text: $title)
                        .foregroundColor(.black)
                }
                .listRowBackground(Color.white)
                
                Section(header: Text("Project Details").font(.headline)) {
                    TextEditor(text:$datails)
                        .foregroundColor(.black)
                        .frame(height: 100)
                }
                .listRowBackground(Color.white)
                
                Section(header: Text("Due Date").font(.headline)) {
                    HStack {
                        Image(systemName: "calendar")
                        Image(systemName: "clock")
                        Spacer()
                        
                        DatePicker("", selection: $dueDate, displayedComponents: [.date, .hourAndMinute])
                            .colorInvert()
                            .labelsHidden()
                    }
                    
                }
                .listRowBackground(Color
                    .gray
                    .opacity(0.9))

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

struct CreateProjectView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProjectView()
    }
}
