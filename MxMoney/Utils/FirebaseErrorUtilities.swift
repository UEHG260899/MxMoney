//
//  FirebaseErrorUtilities.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 06/05/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

enum FirebaseErrorUtilities {

    static func getAuthErrorDescription(for error: NSError) -> String {
        guard let firebaseError = AuthErrorCode.Code(rawValue: error.code) else {
            return NSLocalizedString("Default.Error.Text", comment: "")
        }

        switch firebaseError {
        case .networkError:
            return NSLocalizedString("Network.Error.Text", comment: "")
        case .invalidEmail:
            return NSLocalizedString("Invalid.Email.Error.Text", comment: "")
        case .userDisabled:
            return NSLocalizedString("Disabled.User.Error.Text", comment: "")
        case .emailAlreadyInUse:
            return NSLocalizedString("Email.Used.Error.Text", comment: "")
        case .weakPassword:
            return NSLocalizedString("Weak.Password.Error.Text", comment: "")
        case .wrongPassword:
            return NSLocalizedString("Wrong.Password.Error.Text", comment: "")
        default:
            return NSLocalizedString("Default.Error.Text", comment: "")
        }

    }

    static func getFirestoreErrorDescription(for error: NSError) -> String {
        guard let firebaseError = FirestoreErrorCode.Code(rawValue: error.code) else {
            return NSLocalizedString("Default.Error.Text", comment: "")
        }

        switch firebaseError {
        case .invalidArgument:
            return NSLocalizedString("Invalid.Argument.Error.Text", comment: "")
        case .deadlineExceeded:
            return NSLocalizedString("Deadline.Exceeded.Error.Text", comment: "")
        case .notFound:
            return NSLocalizedString("No.Data.Error.Text", comment: "")
        case .alreadyExists:
            return NSLocalizedString("Already.Exists.Error.Text", comment: "")
        case .unavailable:
            return NSLocalizedString("Unavailable.Error.Text", comment: "")
        default:
            return NSLocalizedString("Default.Error.Text", comment: "")
        }
    }
}
