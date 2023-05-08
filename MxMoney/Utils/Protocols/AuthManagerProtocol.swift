//
//  AuthManagerProtocol.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 06/05/23.
//

import Foundation

protocol AuthManagerProtocol {
    /// Creates a new user in FirebaseAuthentication
    /// - Parameters:
    ///   - email: User´s email
    ///   - password: User´s password
    ///   - completion: Returns the new user id if it was successful or a custom error otherwise
    func register(email: String, password: String, completion: @escaping (Result<String, AppError>) -> Void)
}
