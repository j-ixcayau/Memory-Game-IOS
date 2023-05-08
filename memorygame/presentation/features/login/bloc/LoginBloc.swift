//
//  LoginBloc.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 23/04/23.
//

import Foundation
import Firebase
import FirebaseCore
import FirebaseAuth

class LoginBloc: ObservableObject {
    
    @Published var emailController: String = ""
    @Published var passwordController: String = ""
    
    @Published var showInvalidFieldsError = false
    
    @Published var showAuthError = false
    @Published var authErrorMessage = ""
    
    private let firebaseAuth = Auth.auth()
    private let stringValidator = StringValidator()
    
    func onLoginTap(){
        let email = emailController.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordController.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if email.isEmpty || password.isEmpty {
            return
        }
        
        let validEmail = stringValidator.isValidEmail(email)
        let validPassword = stringValidator.isValidPassword(password)
        
        if !validEmail || !validPassword {
            showInvalidFieldsError = true
            return
        }
        
        firebaseAuth.signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                let errorCode = (error as NSError).code
                switch errorCode {
                case AuthErrorCode.invalidEmail.rawValue:
                    self.authErrorMessage = "Invalid email"
                case AuthErrorCode.wrongPassword.rawValue:
                    self.authErrorMessage = "Wrong password"
                case AuthErrorCode.userNotFound.rawValue:
                    self.authErrorMessage = "User not found"
                case AuthErrorCode.networkError.rawValue:
                    self.authErrorMessage = "Network error"
                default:
                    self.authErrorMessage = "Other error occurred: \(error.localizedDescription)"
                }
                
                self.showAuthError = true
                
                return
            }
            
            
            if let user = authResult?.user {
                print("User logged in \(user.uid)")
            }
        }
    }
}

