//
//  MemoryGameBloc.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 10/04/23.
//

import Foundation

class MemoryGameBloc: ObservableObject {
    
    @Published var words = [GuessWord]()
    @Published var difficultyLevel: DifficultyLevel
    
    let wordsManager = WordsManager()
    
    @Published var previousIndex: Int? = nil
    
    init(difficultyLevel: DifficultyLevel){
        self.difficultyLevel = difficultyLevel
        
        let guesWords = wordsManager.getListShuffled(dificultyLevel: difficultyLevel)
        
        for word in guesWords {
            words.append(word)
        }
    }
    
    func onCardTap(index: Int) {
        let guessWord = words[index]
        if (guessWord.isGuessed || guessWord.isGuessing || guessWord.isFlipped){
            return
        }
        
        guessWord.startGuessing()
        self.objectWillChange.send()
        
        if previousIndex == nil {
            previousIndex = index
            return
        }
        
        let currentWord = words[index].word
        let previousWord = words[previousIndex!].word
        
        if currentWord == previousWord {
            words[previousIndex!].markAsGuessed()
            words[index].markAsGuessed()
            previousIndex = nil
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                self.words[self.previousIndex!].resetValues()
                self.words[index].resetValues()
                
                self.previousIndex = nil
                
                self.objectWillChange.send()
            }
        }
    }
}
