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
    /// - Returns: User id if successful
    func register(email: String, password: String) async throws -> String

    /// Logs in a User in firebase
    /// - Parameters:
    ///   - email: User´s email
    ///   - password: User´s password
    func login(email: String, password: String) async throws
}
