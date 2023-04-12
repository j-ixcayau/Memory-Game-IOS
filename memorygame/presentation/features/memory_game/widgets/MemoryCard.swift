//
//  MemoryCard.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 5/04/23.
//

import SwiftUI

struct MemoryCard: View {
    let guessWord: GuessWord
    let onTap: () -> Void
    
    var body: some View {
        ZStack{
            Color("BackgroundColor")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Text(guessWord.word)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .opacity(guessWord.isFlipped ? 1 : 0)
                .animation(.spring(), value: guessWord.isFlipped)
        }
        .frame(width: 100, height: 100)
        .overlay(
            RoundedRectangle(
                cornerRadius: 16
            )
            .stroke(
                .blue,
                lineWidth: 4
            )
        )
        .rotation3DEffect(.degrees(guessWord.isFlipped ? 0: 180), axis: (x: 1, y: 1, z: 0))
        .animation(.spring(), value: guessWord.isFlipped)
        .onTapGesture {
            onTap()
        }
        .padding()
        //        .onAppear {
        //            guessWord.isFlipped = (guessWord.isGuessed || guessWord.isGuessing || guessWord.isFlipped)
        //        }
    }
}

struct MemoryCard_Previews: PreviewProvider {
    static var previews: some View {
        MemoryCard(
            guessWord: GuessWord(word: "TS"),
            onTap: {
                
            }
        )
    }
}
