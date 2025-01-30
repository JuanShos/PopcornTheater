//
//  ErrorHandling.swift
//  PopcornTheater
//
//  Created by Juanito Martinon on 1/29/25.
//

import Foundation

// MARK: LEARN HOW TO LOG ERRORS AT SOME POINT; ALSO ID LIKE TO SEE THE HTTP RESPONSE CODE ERROR
enum CallError: Error {
    case runTimeError(String)
}
