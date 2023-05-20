//
//  AuthManager.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 06/05/23.
//

import Foundation
import FirebaseAuth

class AuthManager: AuthManagerProtocol {

    func register(email: String, password: String) async throws -> String {
        return try await withCheckedThrowingContinuation({ continuation in
            Auth.auth().createUser(withEmail: email, password: password) { authResponse, error in
                if let error {
                    let nsError = error as NSError
                    let description = FirebaseErrorUtilities.getAuthErrorDescription(for: nsError)
                    continuation.resume(throwing: AppError.authentication(description))
                    return
                }

                guard let authResponse else {
                    continuation.resume(throwing: AppError.authentication("No user available"))
                    return
                }

                continuation.resume(returning: authResponse.user.uid)
            }
        })
    }

    func login(email: String, password: String) async throws {
        try await withCheckedThrowingContinuation({ (continuation: CheckedContinuation<Void, Error>) in
            Auth.auth().signIn(withEmail: email, password: password) { _, error in
                if let error {
                    let nsError = error as NSError
                    let description = FirebaseErrorUtilities.getAuthErrorDescription(for: nsError)
                    continuation.resume(throwing: AppError.authentication(description))
                    return
                }

                continuation.resume(returning: ())
            }
        })
    }
}
