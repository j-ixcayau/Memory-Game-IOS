//
//  RegisterBloc.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 7/05/23.
//

import Foundation

class RegisterBloc: ObservableObject {
    
    @Published var emailController: String = ""
    @Published var passwordController: String = ""
    @Published var confirmPasswordController: String = ""
    
    @Published var showAlert: Bool = false
    var showAlertType: RegisterAlertType = RegisterAlertType.invalidCredentials
    
    private let stringValidator = StringValidator()
    private let repository = AuthRepositoryImpl()
    
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
        repository.register(email, password) { uid in
            print("User logged in \(uid)")
        } onError: { error in
            self.showAlertType = .registerError(error)
            self.showAlert = true
        }
    }
}
