//
//  RegisterPage.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 7/05/23.
//

import SwiftUI

struct RegisterPage: View {
    
    @ObservedObject var registerBloc: RegisterBloc = RegisterBloc()
    
    var body: some View {
        VStack {
            CommonInput(
                content: $registerBloc.emailController,
                title: "Email",
                hint: "abcd@gmail.com",
                keyboardType: UIKeyboardType.emailAddress
            )
            
            PasswordInput(
                content: $registerBloc.passwordController,
                title: "Password",
                hint: "Abcd123$"
            )
            
            PasswordInput(
                content: $registerBloc.confirmPasswordController,
                title: "Confirm Password",
                hint: "Abcd123$"
            )
            .padding(.bottom, 50)
            
            CommonButtons(
                title: "Register",
                action: {
                    registerBloc.onRegisterTap()
                }
            )
            .padding(.bottom, 50)
            .alert(isPresented: $registerBloc.showAlert) {
                switch registerBloc.showAlertType {
                case .invalidCredentials:
                    return Alert(
                        title: Text("Invalid credentials"),
                        message: Text("Please check your email or password to match the required format"),
                        dismissButton: .default(Text("OK"))
                    )
                case .unmatchedPasswords:
                    return  Alert(
                        title: Text("Invalid credentials"),
                        message: Text("Please match your passwords to continue"),
                        dismissButton: .default(Text("OK"))
                    )
                case .registerError(let error):
                    return Alert(
                        title: Text("Something went wrong"),
                        message: Text(error),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }
        }
        .padding()
        .navigationTitle("Register")
        .commonBackground()
    }
}

struct RegisterPage_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPage()
    }
}
