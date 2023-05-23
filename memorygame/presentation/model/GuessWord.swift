//
//  guessWord.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 7/04/23.
//

import Foundation

class GuessWord: ObservableObject, CustomStringConvertible {
    let id = UUID()
    let word: String
    
    @Published var isGuessed: Bool = false
    @Published var isGuessing: Bool = false
    @Published var isFlipped: Bool = false
    
    init(word: String) {
        self.word = word
    }
    
    func startGuessing(){
        isGuessing = true
        isFlipped = true
    }
    
    func markAsGuessed(){
        isGuessed = true
        isFlipped = true
    }
    
    func resetValues(){
        isGuessed = false
        isGuessing = false
        isFlipped = false
    }
    
    var description: String {
        return "GuessWord(id: \(id), word: \(word), isGuessed: \(isGuessed), isGuessing: \(isGuessing), isFlipped: \(isFlipped))"
    }
}
