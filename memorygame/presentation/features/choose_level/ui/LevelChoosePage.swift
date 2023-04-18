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
                    value: "Easy",
                    difficultyLevel: .Easy
                )
                
                LevelChooseWidget(
                    value: "Medium",
                    difficultyLevel: .Medium
                )
                
                LevelChooseWidget(
                    value: "Hard",
                    difficultyLevel: .Hard
                )
            }
        )
    }
}

struct LevelChoosePage_Previews: PreviewProvider {
    static var previews: some View {
        LevelChoosePage()
    }
}
