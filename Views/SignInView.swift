//
//  SignInView.swift
//  HocusFocusApp
//
//  Created by liz arbieto on 2025-02-16.
//

/*import SwiftUI
 
 struct SignInView: View {
 @State private var email = ""
 @State private var password = ""
 
 var body: some View {
 NavigationStack {
 VStack {
 Spacer()
 Image("wizard_icon")
 .resizable()
 .frame(width: 100, height: 100)
 
 Text("Welcome to Hocus Focus")
 .font(.title)
 .bold()
 
 TextField("Email or phone number", text: $email)
 .textFieldStyle(RoundedBorderTextFieldStyle())
 .padding()
 .onTapGesture { self.dismissKeyboard() }
 
 SecureField("Password", text: $password)
 .textFieldStyle(RoundedBorderTextFieldStyle())
 .padding()
 .onTapGesture { self.dismissKeyboard() }
 
 Button("Login") {
 // Acción de inicio de sesión
 }
 .frame(maxWidth: .infinity)
 .padding()
 .background(Color.purple)
 .foregroundColor(.white)
 .cornerRadius(10)
 
 Spacer()
 
 HStack {
 Text("Don't have an account?")
 .font(.caption)
 .foregroundColor(.gray)
 
 NavigationLink("Sign Up", destination: SignUpView())
 .font(.caption)
 .fontWeight(.bold)
 .foregroundColor(.purple)
 }
 .padding()
 }
 .padding()
 .background(Color.white)
 .onTapGesture {
 self.dismissKeyboard()
 }
 }
 }
 }
 
 extension View {
 func dismissKeyboard() {
 UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
 }
 }
 
 */

import SwiftUI

struct SignInView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isAuthenticated = false
    @State private var userName = ""
    @State private var errorMessage = ""

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Image("wizard_icon")
                    .resizable()
                    .frame(width: 100, height: 100)
                
                Text("Welcome to Hocus Focus")
                    .font(.title)
                    .bold()
                
                TextField("Email or phone number", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .onTapGesture { self.dismissKeyboard() }
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .onTapGesture { self.dismissKeyboard() }
                
                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.caption)
                        .padding()
                }
                
                Button("Login") {
                    authenticateUser()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Spacer()
                
                HStack {
                    Text("Don't have an account?")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    NavigationLink("Sign Up", destination: SignUpView())
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.purple)
                }
                .padding()
            }
            .padding()
            .background(Color.white)
            .onTapGesture {
                self.dismissKeyboard()
            }
            .navigationDestination(isPresented: $isAuthenticated) {
                HomeView(userName: userName)
            }
        }
    }

    func authenticateUser() {
        let fileName = "users.txt"
        let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = directory.appendingPathComponent(fileName)
        
        do {
            let data = try Data(contentsOf: fileURL)
            let users = try JSONDecoder().decode([User].self, from: data)
            
            if let user = users.first(where: { $0.email == email && $0.password == password }) {
                userName = user.name
                isAuthenticated = true
                errorMessage = ""
            } else {
                errorMessage = "Invalid email or password."
            }
        } catch {
            errorMessage = "Error loading user data."
        }
    }
}

extension View {
    func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

