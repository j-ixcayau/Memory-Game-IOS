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
        BaseScreen(
            navigationTitle: "Choose a level",
            child: {
                LevelChooseWidget(
                    difficultyLevel: .Easy,
                    onTap: onDifficultyTap
                )
                
                LevelChooseWidget(
                    difficultyLevel: .Medium,
                    onTap: onDifficultyTap
                )
                
                LevelChooseWidget(
                    difficultyLevel: .Hard,
                    onTap: onDifficultyTap
                )
                .navigationDestination(
                    isPresented: $levelChooseBloc.isNavigationActive,
                    destination: {
                        MemoryGamePage(difficultyLevel: levelChooseBloc.difficultyLevel)
                    }
                )
            }
        )
    }
    
    func onDifficultyTap(difficultyLevel: DifficultyLevel){
        levelChooseBloc.difficultyLevel = difficultyLevel
        levelChooseBloc.isNavigationActive.toggle()
    }
}

struct LevelChoosePage_Previews: PreviewProvider {
    static var previews: some View {
        LevelChoosePage()
    }
}
