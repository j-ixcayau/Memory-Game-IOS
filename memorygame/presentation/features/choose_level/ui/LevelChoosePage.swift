//
//  LevelChoosePage.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 11/04/23.
//

import SwiftUI

struct LevelChoosePage: View {
    @ObservedObject var levelChooseBloc: LevelChooseBloc = LevelChooseBloc()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                ForEach(DifficultyLevel.allCases, id: \.description){ level in
                    LevelChooseWidget(
                        difficultyLevel: level,
                        onTap: onDifficultyTap
                    )
                    .frame(height: 100)
                }
                
                Spacer()
                
                SecondaryButton(
                    title: "List won games",
                    action: {
                        levelChooseBloc.isNavigationToListActive.toggle()
                    }
                )
                
                Spacer()
                
                CommonButtons(
                    title: "Logout",
                    action: {
                        levelChooseBloc.logout()
                    }
                )
            }
            .padding()
            .navigationTitle("Choose a level")
            .commonBackground()
            .navigationDestination(
                isPresented: $levelChooseBloc.isNavigationToGameActive,
                destination: {
                    MemoryGamePage(
                        difficultyLevel: levelChooseBloc.difficultyLevel
                    )
                }
            )
            .navigationDestination(
                isPresented: $levelChooseBloc.isNavigationToListActive,
                destination: {
                    ListWonGamesPage()
                }
            )
        }
    }
    
    func onDifficultyTap(difficultyLevel: DifficultyLevel){
        levelChooseBloc.difficultyLevel = difficultyLevel
        levelChooseBloc.isNavigationToGameActive.toggle()
    }
}

struct LevelChoosePage_Previews: PreviewProvider {
    static var previews: some View {
        LevelChoosePage()
    }
}
