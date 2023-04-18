//
//  MemoryGameBloc.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 10/04/23.
//

import Foundation
import UIKit

class MemoryGameBloc: ObservableObject {
    
    let wordsManager = WordsManager()
    var isGuessing: Bool  = false
    
    @Published var words = [GuessWord]()
    @Published var difficultyLevel: DifficultyLevel
    @Published var previousIndex: Int? = nil
    @Published var attemptsCount: Int = 0
    
    init(difficultyLevel: DifficultyLevel){
        self.difficultyLevel = difficultyLevel
        
        let guesWords = wordsManager.getListShuffled(dificultyLevel: difficultyLevel)
        
        for word in guesWords {
            words.append(word)
        }
    }
    
    func onCardTap(index: Int) {
        let guessWord = words[index]
        if (guessWord.isGuessed || guessWord.isGuessing || guessWord.isFlipped || isGuessing){
            return
        }
        
        guessWord.startGuessing()
        self.objectWillChange.send()
        
        if let previousIndex = previousIndex {
            isGuessing = true
            
            let currentWord = words[index].word
            let previousWord = words[previousIndex].word
            
            if currentWord == previousWord {
                words[previousIndex].markAsGuessed()
                words[index].markAsGuessed()
                self.previousIndex = nil
                isGuessing = false
                
                objectWillChange.send()
            } else {
                attemptsCount += 1
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    UINotificationFeedbackGenerator().notificationOccurred(.error)
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    self.words[previousIndex].resetValues()
                    self.words[index].resetValues()
                    self.previousIndex = nil
                    self.isGuessing = false
                    
                    self.objectWillChange.send()
                }
            }
        } else {
            self.previousIndex = index
        }
    }
}
