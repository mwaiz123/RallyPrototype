//
//  LoginView.swift
//  RallyPrototype
//
//  Created by Mansib Waiz on 2025-04-10.
//

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var isLoggedIn = false
    @State private var loginMessage = ""

    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome Back!")
                    .font(.system(size: 36, weight: .bold))
                    .padding(.bottom, 6)
                
                Text("Log in to your account")
                    .padding(.bottom, 50)

                TextField("Username", text: $username)
                    .textInputAutocapitalization(.never)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(loginMessage == "Wrong Username" ? Color.red : Color.clear, lineWidth: 2)
                    )

                SecureField("Password", text: $password)
                    .textInputAutocapitalization(.never)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(loginMessage == "Wrong Password" ? Color.red : Color.clear, lineWidth: 2)
                    )

                Button("Login") {
                    authenticate(username: username, password: password)
                }
                .foregroundStyle(.white)
                .frame(width: 300, height: 50)
                .background(.blue)
                .cornerRadius(10)

                if !loginMessage.isEmpty {
                    Text(loginMessage)
                        .foregroundColor(.red)
                }
                
                HStack {
                    Text("Don't have an account?")
                        .foregroundColor(.gray)
                        .padding(.top, 4)
                    NavigationLink(destination: SignUpView()) {
                        Text("Sign Up")
                            .padding(.top, 4)
                            .foregroundColor(.blue)
                            .fontWeight(.bold)
                            .underline()
                    }
                }
            }
            .navigationDestination(isPresented: $isLoggedIn) {
                HomeView()
            }
        }
    }

    func authenticate(username: String, password: String) {
        if username == "mansibwaiz" {
            if password == "abc123" {
                loginMessage = ""
                isLoggedIn = true
            } else {
                loginMessage = "Wrong Password"
            }
        } else {
            loginMessage = "Wrong Username"
        }
    }
}

#Preview {
    LoginView()
}

