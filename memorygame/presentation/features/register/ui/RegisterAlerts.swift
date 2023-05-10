//
//  RegisterAlerts.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 8/05/23.
//

import Foundation

enum RegisterAlertType {
    case invalidCredentials,
         unmatchedPasswords,
         registerError(String)
}
