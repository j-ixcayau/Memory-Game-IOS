//
//  ListWonGamesBloc.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 23/05/23.
//

import Foundation

class ListWonGamesbloc: ObservableObject {
    
    private let authRepository = AuthRepositoryImpl()
    private let gamesRepository = GuessWordRepositoryImpl()
    
    @Published var games = [GameWin]()
    
    func getWonGames(){
        let userId = authRepository.getUserId() ?? ""
        
        gamesRepository.getWonGames(userId) { games in
            self.games = games
        }
    }
}
