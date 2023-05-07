//
//  AuthManager.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 06/05/23.
//

import Foundation
import FirebaseAuth

class AuthManager: AuthManagerProtocol {

    func register(email: String, password: String, completion: @escaping (Result<Void, AppError>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { _, error in
            if let error {
                let nsError = error as NSError
                let description = FirebaseErrorUtilities.getAuthErrorDescription(for: nsError)
                completion(.failure(.authentication(description)))
                return
            }

            completion(.success(()))
        }
    }
}
