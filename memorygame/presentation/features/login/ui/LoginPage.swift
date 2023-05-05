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
                
                CommonInput(
                    content: $loginBloc.passwordController,
                    title: "Password",
                    isPassword: true,
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
        }
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
