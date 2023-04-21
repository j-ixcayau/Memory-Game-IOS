//
//  LevelChooseWidget.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 11/04/23.
//

import SwiftUI

struct LevelChooseWidget: View {
    let difficultyLevel: DifficultyLevel
    let onTap: (_ difficultyLevel: DifficultyLevel) -> Void
    
    var body: some View {
        OnViewTap(
            child: {
                Text(difficultyLevel.description)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 70)
            },
            onTap: {
                onTap(difficultyLevel)
            }
        )
    }
}

struct LevelChooseWidget_Previews: PreviewProvider {
    static var previews: some View {
        LevelChooseWidget(
            difficultyLevel: .Easy,
            onTap: { difficultyLevel in
                
            }
        )
    }
}
