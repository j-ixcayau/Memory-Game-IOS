//
//  LevelChooseWidget.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 11/04/23.
//

import SwiftUI

struct LevelChooseWidget: View {
    let value: String
    let difficultyLevel: DifficultyLevel
    
    var body: some View {
        
        NavigationLink(
            destination: MemoryGamePage(difficultyLevel: difficultyLevel)
        ) {
            Text(value)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 70)
                .overlay(
                    RoundedRectangle(
                        cornerRadius: 16
                    )
                    .stroke(
                        .blue,
                        lineWidth: 4
                    )
                )
        }
        .padding()
    }
}

struct LevelChooseWidget_Previews: PreviewProvider {
    static var previews: some View {
        LevelChooseWidget(
            value: "Easy",
            difficultyLevel: .Easy
        )
    }
}
