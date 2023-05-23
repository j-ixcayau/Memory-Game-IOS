//
//  RootBloc.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 21/04/23.
//

import Foundation
import SwiftUI

class RootBloc: ObservableObject {
    @Published var isLoginNavigationActive: Bool = false
    @Published var isHomeNavigationActive: Bool = false
    
    private let repository = AuthRepositoryImpl()
    
    func checkUserLogged(){
        repository.addStateDidChangeListener { isUserLogged in
            if isUserLogged {
                self.isHomeNavigationActive = true
                self.isLoginNavigationActive = false
            } else {
                self.isLoginNavigationActive = true
                self.isHomeNavigationActive = false
            }
        }
    }
}
