//
//  RootBloc.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 21/04/23.
//

import Foundation
import Firebase
import SwiftUI

class RootBloc: ObservableObject {
    @Published var isLoginNavigationActive: Bool = false
    @Published var isHomeNavigationActive: Bool = false
    
    private let firebaseAuth = Auth.auth()
    
    func checkUserLogged(){
        firebaseAuth.addStateDidChangeListener { auth, user in
            if user != nil {
                self.isHomeNavigationActive = true
                self.isLoginNavigationActive = false
            } else {
                self.isLoginNavigationActive = true
                self.isHomeNavigationActive = false
            }
        }
    }
}
