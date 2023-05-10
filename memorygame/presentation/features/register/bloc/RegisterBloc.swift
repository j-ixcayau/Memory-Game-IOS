//
//  RegisterBloc.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 7/05/23.
//

import Foundation
import Firebase
import FirebaseCore
import FirebaseAuth

class RegisterBloc: ObservableObject {
    
    @Published var emailController: String = ""
    @Published var passwordController: String = ""
    @Published var confirmPasswordController: String = ""
    
    @Published var showAlert: Bool = false
    var showAlertType: RegisterAlertType = RegisterAlertType.invalidCredentials
    
    private let firebaseAuth = Auth.auth()
    private let stringValidator = StringValidator()
    
    func onRegisterTap(){
        let email = emailController.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordController.trimmingCharacters(in: .whitespacesAndNewlines)
        let confirmPassword = confirmPasswordController.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if email.isEmpty || password.isEmpty || confirmPassword.isEmpty {
            return
        }
        
        if password != confirmPassword {
            showAlertType = .unmatchedPasswords
            showAlert = true
            return
        }
        
        let validEmail = stringValidator.isValidEmail(email)
        let validPassword = stringValidator.isValidPassword(password)
        
        if !validEmail || !validPassword {
            showAlertType = .invalidCredentials
            showAlert = true
            return
        }
        
        performRegister(email, password)
    }
    
    private func performRegister(_ email: String, _ password: String){
        firebaseAuth.createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                let errorCode = (error as NSError).code
                var errorMesssage: String = ""
                
                switch errorCode {
                case AuthErrorCode.emailAlreadyInUse.rawValue:
                    errorMesssage = "The email address is already in use"
                default:
                    errorMesssage = "Other error occurred: \(error.localizedDescription)"
                }
                
                self.showAlertType = .registerError(errorMesssage)
                self.showAlert = true
                
                return
            }
            
            
            if let user = authResult?.user {
                print("User logged in \(user.uid)")
            }
        }
    }
}
