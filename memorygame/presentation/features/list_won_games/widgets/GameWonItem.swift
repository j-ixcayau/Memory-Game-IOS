//
//  GameWonItem.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 25/05/23.
//

import SwiftUI

struct GameWonItem: View {
    let game: GameWin
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Difficulty")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text(game.difficulty.description)
                    .font(.headline)
                    .foregroundColor(.accentColor)
            }
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text("Error Attempts")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text("\(game.attemptsError)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text("Time Expended")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text("\(game.secondsExpended) seconds")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text("Date")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text(game.getDate())
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
    }
}
