//
//  difficultyLevel.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 7/04/23.
//

import Foundation

enum DifficultyLevel: CustomStringConvertible, CaseIterable {
    case Easy
    case Medium
    case Hard
    
    var description : String {
        switch self {
        case .Easy: return "Easy"
        case .Medium: return "Medium"
        case .Hard: return "Hard"
        }
    }
    
    static func fromString(_ value: String) -> DifficultyLevel {
        for level in DifficultyLevel.allCases {
            if level.description == value {
                return level
            }
        }
        
        return DifficultyLevel.Easy
    }
}
