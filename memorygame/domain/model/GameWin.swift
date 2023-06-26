//
//  GameWin.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 13/05/23.
//

import Foundation
import FirebaseFirestore

struct GameWin {
    let id: String?
    let attemptsError: Int
    let creationDate: Date?
    let difficulty: DifficultyLevel
    let secondsExpended: Double
    let userId: String
    
    init(id: String, info: [String: Any]) {
        self.id = id
        attemptsError = info["attempsError"] as! Int
        creationDate = (info["creationDate"] as! Timestamp).dateValue()
        difficulty = DifficultyLevel.fromString(info["difficulty"] as! String)
        secondsExpended = info["secondsExpended"] as! Double
        userId = info["userId"] as! String
    }
    
    init(attemptsError: Int, creationDate: Date?, difficulty: DifficultyLevel, secondsExpended: Double, userId: String) {
        self.id = nil
        self.attemptsError = attemptsError
        self.creationDate = creationDate
        self.difficulty = difficulty
        self.secondsExpended = secondsExpended
        self.userId = userId
    }
    
    
    func getDate() -> String {
        return dateToString(date: creationDate ?? Date.now)
    }
    
    private func dateToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        return dateFormatter.string(from: date)
    }
    
    
    func toJsonFb() -> Dictionary<String, Any> {
        return [
            "userId": userId,
            "difficulty": difficulty.description,
            "attempsError" : attemptsError,
            "secondsExpended": secondsExpended,
            "creationDate": FieldValue.serverTimestamp()
        ]
    }
}
