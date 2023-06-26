//
//  LevelChooseBloc.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 11/04/23.
//

import Foundation

class LevelChooseBloc: ObservableObject {
    @Published var difficultyLevel: DifficultyLevel = .Easy
    
    @Published var isNavigationToGameActive: Bool = false
    @Published var isNavigationToListActive: Bool = false
    
    private let repository = AuthRepositoryImpl()
    
    func logout() {
        repository.signout()
    }
}
