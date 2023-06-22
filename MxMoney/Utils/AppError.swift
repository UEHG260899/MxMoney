//
//  AppError.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 06/05/23.
//

import Foundation

enum AppError: Error {
    case authentication(String)
    case `internal`(String)
    case firestore(String)
    #if DEBUG
    case testing(String)
    #endif
}

