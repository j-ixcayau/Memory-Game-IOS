//
//  LoginBloc.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 23/04/23.
//

import Foundation

class LoginBloc: ObservableObject {
    
    @Published var emailController: String = ""
    @Published var passwordController: String = ""
    
    @Published var showAlert: Bool = false
    var showAlertType: LoginAlertType = LoginAlertType.invalidCredentials
    
    private let stringValidator = StringValidator()
    private let repository = AuthRepositoryImpl()
    
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
        
        repository.login(email, password) { uid in
            print("User logged in \(uid)")
        } onError: { error in
            self.showAlertType = .registerError(error)
            self.showAlert = true
        }
    }
}

