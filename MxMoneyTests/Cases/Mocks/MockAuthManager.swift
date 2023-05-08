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
    }

    var calledMethods: CalledMethods = []
    var receivedEmail: String?
    var receivedPassword: String?
    var shouldCompleteWith: Result<String, AppError>?

    func register(email: String, password: String, completion: @escaping (Result<String, AppError>) -> Void) {
        calledMethods.insert(.register)
        receivedEmail = email
        receivedPassword = password
        
        if let shouldCompleteWith {
            completion(shouldCompleteWith)
        }
    }
}
