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
    
    let difficultyLevel: DifficultyLevel
    let currentDate: Date
    
    @Published var words = [GuessWord]()
    @Published var previousIndex: Int? = nil
    @Published var attempErrorsCounter: Int = 0
    
    @Published var showAlert: Bool = false
    var showAlertType: MemoryGameAlertType = MemoryGameAlertType.gameWon
    
    private let gameRepository = GuessWordRepositoryImpl()
    private let authRepository = AuthRepositoryImpl()
    
    init(difficultyLevel: DifficultyLevel, currentDate: Date){
        self.difficultyLevel = difficultyLevel
        self.currentDate = currentDate
        
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
                
                self.checkIfGameCompleted()
            } else {
                attempErrorsCounter += 1
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    self.displayErrorVibrations()
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
    
    private func checkIfGameCompleted(){
        let wordUngessed = words.first(where: { !$0.isGuessed } )
        
        if wordUngessed != nil {
            return
        }
        
        onGameWinned()
    }
    
    private func onGameWinned(){
        let userId = authRepository.getUserId() ?? ""
        
        let secondsExpended = currentDate.timeIntervalSinceNow
        
        let gameWin = GameWin(
            attemptsError: attempErrorsCounter,
            creationDate: nil,
            difficulty: difficultyLevel,
            secondsExpended: secondsExpended.magnitude,
            userId: userId
        )
        
        gameRepository.saveWonGame(game: gameWin) {
            self.showAlert = true
            self.showAlertType = .gameWon
        } onError: { error in
            print("Game winned could not be saved")
        }
        
    }
    
    private func displayErrorVibrations(){
        UINotificationFeedbackGenerator().notificationOccurred(.error)
    }
}
