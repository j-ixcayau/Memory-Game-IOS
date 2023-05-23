//
//  GameWin.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 13/05/23.
//

import Foundation
import FirebaseFirestore

struct GameWin {
    let attemptsError: Int
    let creationDate: Date?
    let difficulty: DifficultyLevel
    let secondsExpended: Double
    let userId: String
    
    
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
