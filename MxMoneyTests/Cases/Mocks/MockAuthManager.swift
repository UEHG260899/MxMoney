//
//  MockAuthManager.swift
//  MxMoneyTests
//
//  Created by Uriel Hernandez Gonzalez on 06/05/23.
//

import Foundation
@testable import MxMoney

class MockAuthManager: AuthManagerProtocol {

    struct CalledMethods: OptionSet {
        let rawValue: Int

        static let register = CalledMethods(rawValue: 1 << 0)
        static let login = CalledMethods(rawValue: 1 << 1)
    }

    var calledMethods: CalledMethods = []
    var receivedEmail: String?
    var receivedPassword: String?
    var shouldCompleteWith: Result<String, AppError>?

    func register(email: String, password: String) async throws -> String {
        calledMethods.insert(.register)
        receivedEmail = email
        receivedPassword = password
        return try await withCheckedThrowingContinuation({ continuation in
            if let completeWith = shouldCompleteWith {
                switch completeWith {
                case .success(let value):
                    continuation.resume(returning: value)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
                return
            }

            continuation.resume(returning: "")
        })
    }

    func login(email: String, password: String) async throws {
        calledMethods.insert(.login)
        receivedEmail = email
        receivedPassword = password
        try await withCheckedThrowingContinuation({ (continuation: CheckedContinuation<Void, Error>) in
            if let completeWith = shouldCompleteWith {
                switch completeWith {
                case .success:
                    continuation.resume(returning: ())
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
                return
            }

            continuation.resume(returning: ())
        })
    }
}
