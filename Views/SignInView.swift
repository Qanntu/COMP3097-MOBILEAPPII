//
//  SignInView.swift
//  HocusFocusApp
//
//  Created by liz arbieto on 2025-02-16.
//

import SwiftUI

struct SignInView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isAuthenticated = false
    @State private var userName = ""
    @State private var userId = ""
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
                .background(Color(red: 0.35, green: 0.30, blue: 0.62))
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
                HomeView(userName: userName, userId: userId)
            }
        }
    }
    
    func authenticateUser() {
        guard let url = URL(string: "http://localhost:5000/api/users/login") else { return }
        
        let lowercasedEmail = email.lowercased()

        let body: [String: Any] = [
            "email": lowercasedEmail,
            "password": password
        ]
        
        guard let finalBody = try? JSONSerialization.data(withJSONObject: body) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = finalBody
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    self.errorMessage = "Network error. Please try again."
                }
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                if let responseData = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let userName = responseData["name"] as? String,
                   let userId = responseData["id"] as? String {
                    DispatchQueue.main.async {
                        self.userName = userName
                        self.isAuthenticated = true
                        self.navigateToHome(userName: userName, userId: userId)
                    }
                }
            } else {
                DispatchQueue.main.async {
                    self.errorMessage = "Invalid email/password"
                }
            }
        }.resume()
    }

    func navigateToHome(userName: String, userId: String) {
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = scene.windows.first else {
            return
        }

        let homeView = HomeView(userName: userName, userId: userId)
        let hostingController = UIHostingController(rootView: homeView)
        
        window.rootViewController = hostingController
        window.makeKeyAndVisible()
    }
}

extension View {
    func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
