//
//  LoginBloc.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 23/04/23.
//

import Foundation
import Firebase

class LoginBloc: ObservableObject {
    
    @Published var emailController: String = ""
    @Published var passwordController: String = ""
    
    private let firebaseAuth = Auth.auth()
    
    func onLoginTap(){
        let email = emailController.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordController.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if email.isEmpty || password.isEmpty {
            return
        }
        
        firebaseAuth.signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print(error)
                return
            }
            
            if let user = authResult?.user {
                print("User logged in \(user.uid)")
            }
        }
    }
}
