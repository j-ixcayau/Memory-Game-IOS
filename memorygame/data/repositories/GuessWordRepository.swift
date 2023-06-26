//
//  GuessWordRepository.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 13/05/23.
//

import Foundation
import FirebaseFirestore

protocol GuessWordRepository {
    func getWonGames(_ uid: String, onSuccess: @escaping ([GameWin]) -> Void)
    func saveWonGame(game: GameWin, onSuccess: @escaping () -> Void, onError: @escaping (Error) -> Void)
}


class GuessWordRepositoryImpl: GuessWordRepository {
    private let databaseReference = Firestore.firestore().collection("gameWin")
    
    func saveWonGame(game: GameWin, onSuccess: @escaping () -> Void, onError: @escaping (Error) -> Void) {
        do {
            try databaseReference.addDocument(data: game.toJsonFb())
            onSuccess()
        } catch let error {
            onError(error)
        }
    }
    
    func getWonGames(_ uid: String, onSuccess: @escaping ([GameWin]) -> Void) {
        databaseReference.whereField("userId", isEqualTo: uid).getDocuments { docs, error in
            if let error = error {
                print(error)
                return
            }
            
            var list: [GameWin] = []
            
            docs?.documents.forEach({ doc in
                let game = GameWin(id: doc.documentID, info: doc.data())
                list.append(game)
            })
            
            onSuccess(list)
        }
    }
}
