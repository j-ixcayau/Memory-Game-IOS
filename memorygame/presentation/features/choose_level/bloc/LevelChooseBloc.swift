//
//  LevelChooseBloc.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 11/04/23.
//

import Foundation
import FirebaseAuth

class LevelChooseBloc: ObservableObject {
    @Published var difficultyLevel: DifficultyLevel = .Easy
    @Published var isNavigationActive: Bool = false
    
    private let firebaseAuth = Auth.auth()
    
    func logout(){
        do {
            try firebaseAuth.signOut()
        } catch {
            print("Unexpected error: \(error).")
        }
    }
}
