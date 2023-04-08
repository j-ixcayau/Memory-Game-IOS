//
//  wordList.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 7/04/23.
//

import Foundation

struct WordsList {
    var WordsList = [
        "Flutter",
        "Dart",
        "Kotlin",
        "Java",
        "Jetpack Compose",
        "Swift",
        "Swift UI",
        "Objective C",
        "Node JS",
        "JS",
        "TS",
        "Angular",
        "React",
    ]
    
    
    func getListShuffled(dificultyLevel: DifficultyLevel) -> [GuessWord] {
        var wordsList: [GuessWord] = []
        
        let wordsChossen = getRandomWords(dificultyLevel: dificultyLevel)
        
        
        for word in wordsChossen {
            wordsList.append(GuessWord(word: word))
            wordsList.append(GuessWord(word: word))
        }
        
        wordsList.shuffle()
        
        return wordsList
    }
    
    func getRandomWords(dificultyLevel: DifficultyLevel) -> [String] {
        let listSize = getListSizeFromDifficulty(dificultyLevel: dificultyLevel)
        var wordsChoosen: [String] = []
        
        while (wordsChoosen.count != listSize){
            let randomWord = WordsList.randomElement()
            
            if randomWord != nil && !wordsChoosen.contains(randomWord!) {
                wordsChoosen.append(randomWord!)
            }
        }
        
        return wordsChoosen
    }
    
    
    func getListSizeFromDifficulty(dificultyLevel: DifficultyLevel) -> Int {
        switch dificultyLevel {
            case .Easy:
                return 3
            case .Medium:
                return 5
            case .Hard:
                return 7
        }
    }
    
}
