//
//  LoginPage.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 20/04/23.
//

import SwiftUI
import Firebase

struct LoginPage: View {
    
    @ObservedObject var loginBloc: LoginBloc = LoginBloc()
    
    var body: some View {
        NavigationStack {
            VStack{
                CommonInput(
                    content: $loginBloc.emailController,
                    title: "Email",
                    keyboardType: UIKeyboardType.emailAddress
                )
                
                PasswordInput(
                    content: $loginBloc.passwordController,
                    title: "Password",
                    keyboardType: UIKeyboardType.default
                )
                .padding(.bottom, 50)
                
                
                CommonButtons(
                    title: "Login",
                    action: {
                        loginBloc.onLoginTap()
                    }
                )
                .padding(.bottom, 50)
            }
            .padding()
            .navigationTitle("Login")
            .commonBackground()
            .alert(isPresented: $loginBloc.showInvalidFieldsError) {
                Alert(
                    title: Text("Invalid credentials"),
                    message: Text("Please check your email or password to match the required format"),
                    dismissButton: .default(Text("OK"))
                )
            }
            .alert(isPresented: $loginBloc.showAuthError) {
                Alert(
                    title: Text("Something went wrong"),
                    message: Text(loginBloc.authErrorMessage),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
