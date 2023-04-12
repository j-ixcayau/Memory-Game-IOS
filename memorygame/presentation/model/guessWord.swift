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
        print("startGuessing \(word)")
        
        isGuessing = true
        isFlipped = true
    }
    
    func markAsGuessed(){
        print("markAsGuessed \(word)")
        
        isGuessed = true
        isFlipped = true
    }
    
    func resetValues(){
        print("resetValues \(word)")
        
        isGuessed = false
        isGuessing = false
        isFlipped = false
    }

    var description: String {
        return "GuessWord(id: \(id), word: \(word), isGuessed: \(isGuessed), isGuessing: \(isGuessing), isFlipped: \(isFlipped))"
    }
}
