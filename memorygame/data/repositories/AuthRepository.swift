//
//  AuthRepository.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 22/05/23.
//

import Foundation
import FirebaseCore
import FirebaseAuth

protocol AuthRepository {
    func addStateDidChangeListener(onChanged: @escaping (Bool) -> Void)
    func register(_ email: String, _ password: String, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void)
    func login(_ email: String, _ password: String, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void)
}

class AuthRepositoryImpl: AuthRepository {
    private let firebaseAuth = Auth.auth()
    
    func addStateDidChangeListener(onChanged: @escaping (Bool) -> Void) {
        firebaseAuth.addStateDidChangeListener { auth, user in
            onChanged(user != nil)
        }
    }
    
    func register(_ email: String, _ password: String, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void) {
        firebaseAuth.createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                let errorCode = (error as NSError).code
                var errorMessage = ""
                
                switch errorCode {
                case AuthErrorCode.emailAlreadyInUse.rawValue:
                    errorMessage = "The email address is already in use"
                default:
                    errorMessage = "Other error occurred: \(error.localizedDescription)"
                }
                
                onError(errorMessage)
                
                return
            }
            
            
            if let user = authResult?.user {
                onSuccess(user.uid)
            }
        }
    }
    
    func login(_ email: String, _ password: String, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void) {
        firebaseAuth.signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                let errorCode = (error as NSError).code
                var errorMessage = ""
                
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
                
                onError(errorMessage)
                
                return
            }
            
            
            if let user = authResult?.user {
                onSuccess(user.uid)
            }
        }
    }
}
