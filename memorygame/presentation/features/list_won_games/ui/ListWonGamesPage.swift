//
//  ListWonGames.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 22/05/23.
//

import SwiftUI

struct ListWonGamesPage: View {
    @ObservedObject var bloc: ListWonGamesbloc = ListWonGamesbloc()
    
    var body: some View {
        BaseScreen {
            ForEach(bloc.games, id: \.id ){ game in
                GameWonItem(game: game)
            }
            
            Spacer()
        }.onAppear{
            bloc.getWonGames()
        }
    }
}

struct ListWonGamesPage_Previews: PreviewProvider {
    static var previews: some View {
        ListWonGamesPage()
    }
}
