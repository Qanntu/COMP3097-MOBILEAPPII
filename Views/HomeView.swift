//
//  HomeView.swift
//  HocusFocusApp
//
//  Created by liz arbieto on 2025-02-16.
//

import SwiftUI

struct HomeView: View {
    var userName: String

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Welcome Back!")
                            .font(.caption)
                            .foregroundColor(.orange)
                        Text(userName)           .font(.title)
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
                    .padding(.leading)
            
                List {
                    ProjectRow(title: "Mobileb App Wireframe", tasks: 21, dueDate: "21 March")
                        .listRowBackground(Color(red: 0.28, green: 0.33, blue: 0.35))
                    ProjectRow(title: "Mobile App MockUp", tasks: 10, dueDate: "21 March")
                        .listRowBackground(Color(red: 0.28, green: 0.33, blue: 0.35))
                    ProjectRow(title: "Backend", tasks: 2, dueDate: "21 March")
                        .listRowBackground(Color(red: 0.28, green: 0.33, blue: 0.35))
                    ProjectRow(title: "Frontend", tasks: 2, dueDate: "21 March")
                        .listRowBackground(Color(red: 0.28, green: 0.33, blue: 0.35))
                    ProjectRow(title: "Design", tasks: 2, dueDate: "21 March")
                        .listRowBackground(Color(red: 0.28, green: 0.33, blue: 0.35))
                }
                .padding()
                .listStyle(PlainListStyle())
                Spacer()
                
                BottomTabBarProject()
            }
            .background(Color(red: 0.35, green: 0.30, blue: 0.62))
            .navigationBarHidden(true)
            .foregroundColor(.white)
        }
        .tint(Color(red: 0.15, green: 0.18, blue: 0.20))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(userName: "userName")
    }
}

