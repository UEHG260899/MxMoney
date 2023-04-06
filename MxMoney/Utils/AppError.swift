//
//  AppError.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 06/04/23.
//

import Foundation

// TODO: Replace with actual errors when backend integration starts
enum AppError: String, Error {
    case `none`

    var rawValue: String {
        switch self {
        case .none:
            return NSLocalizedString("Default.Error.Text", comment: "")
        @unknown default:
            return NSLocalizedString("Default.Error.Text", comment: "")
        }
    }
}
