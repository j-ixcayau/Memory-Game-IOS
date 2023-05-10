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
    
    @Published var showAlert: Bool = false
    var showAlertType: LoginAlertType = LoginAlertType.invalidCredentials
    
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
            showAlertType = .invalidCredentials
            showAlert = true
            
            return
        }
        
        performLogin(email, password)
    }
    
    
    private func performLogin(_ email: String, _ password: String){
        firebaseAuth.signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                let errorCode = (error as NSError).code
                var errorMessage: String = ""
                
                switch errorCode {
                case AuthErrorCode.wrongPassword.rawValue:
                    errorMessage = "Wrong password"
                case AuthErrorCode.userNotFound.rawValue:
                    errorMessage = "User not found"
                case AuthErrorCode.networkError.rawValue:
                    errorMessage = "Network error"
                default:
                    errorMessage = "Other error occurred: \(error.localizedDescription)"
                }
                
                self.showAlertType = .registerError(errorMessage)
                self.showAlert = true
                
                return
            }
            
            
            if let user = authResult?.user {
                print("User logged in \(user.uid)")
            }
        }
    }
}

