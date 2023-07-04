//
//  LoginPage.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 20/04/23.
//

import SwiftUI

struct LoginPage: View {
    
    @ObservedObject var loginBloc: LoginBloc = LoginBloc()
    
    var body: some View {
        NavigationStack {
            VScrollView {
                VStack{
                    CommonInput(
                        content: $loginBloc.emailController,
                        title: "Email",
                        hint: "abcd@gmail.com",
                        keyboardType: UIKeyboardType.emailAddress
                    )
                    
                    PasswordInput(
                        content: $loginBloc.passwordController,
                        title: "Password",
                        hint: "********"
                    )
                    .padding(.bottom, 50)
                    
                    CommonButtons(
                        title: "Login",
                        action: {
                            loginBloc.onLoginTap()
                        }
                    )
                    .padding(.bottom, 50)
                    
                    NavigationLink {
                        RegisterPage()
                    } label: {
                        Text("Register")
                    }
                }
            }
            .padding()
            .navigationTitle("Login")
            .commonBackground()
            .alert(isPresented: $loginBloc.showAlert) {
                switch loginBloc.showAlertType {
                case .invalidCredentials:
                    return Alert(
                        title: Text("Invalid credentials"),
                        message: Text("Please check your email or password to match the required format"),
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
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}


struct VScrollView<Content>: View where Content: View {
  @ViewBuilder let content: Content
  
  var body: some View {
    GeometryReader { geometry in
      ScrollView(.vertical) {
        content
          .frame(width: geometry.size.width)
          .frame(minHeight: geometry.size.height)
      }
    }
  }
}

