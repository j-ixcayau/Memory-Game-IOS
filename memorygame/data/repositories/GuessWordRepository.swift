//
//  GuessWordRepository.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 13/05/23.
//

import Foundation
import FirebaseFirestore

protocol GuessWordRepository {
    func getWinnedGames(_ uid: String, completion: @escaping ([GameWin]) -> Void)
    func saveGameWinned(game: GameWin, onSuccess: @escaping () -> Void, onError: @escaping (Error) -> Void)
}


class GuessWordRepositoryImpl: GuessWordRepository {
    private let databaseReference = Firestore.firestore().collection("gameWin")
    
    func saveGameWinned(game: GameWin, onSuccess: @escaping () -> Void, onError: @escaping (Error) -> Void) {
        do {
            try databaseReference.addDocument(data: game.toJsonFb())
            onSuccess()
        } catch let error {
            onError(error)
        }
    }
    
    func getWinnedGames(_ uid: String, completion: @escaping ([GameWin]) -> Void) {
        
    }
}
