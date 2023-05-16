//
//  MockFirebaseManager.swift
//  MxMoneyTests
//
//  Created by Uriel Hernandez Gonzalez on 15/05/23.
//

import Foundation
@testable import MxMoney

class MockFirebaseManager: FirebaseManagerProtocol {

    struct CalledMethods: OptionSet {
        let rawValue: Int

        static let store = CalledMethods(rawValue: 1 << 0)
    }

    var calledMethods: CalledMethods = []

    func store<T: Encodable>(_ data: T) async throws {
        calledMethods.insert(.store)
    }

}
