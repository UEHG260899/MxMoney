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
        static let fetch = CalledMethods(rawValue: 1 << 1)
        static let fetchRecent = CalledMethods(rawValue: 1 << 2)
    }

    var calledMethods: CalledMethods = []
    var receivedCollectionName: String?
    var receivedId: String?
    var receivedCustomQuery: CustomQuery?

    func store<T: Encodable>(_ data: T, in collectionName: String, with id: String? = nil) async throws {
        calledMethods.insert(.store)
        receivedCollectionName = collectionName
        receivedId = id
        try await withCheckedThrowingContinuation({ continuation in
            continuation.resume()
        })
    }

    func fetch<T: Decodable>(
        fromCollection collection: FirestoreCollection,
        whereQueryIsEqualTo query: CustomQuery
    ) async throws -> [T] {
        calledMethods.insert(.fetch)
        receivedCustomQuery = query
        return [T]()
    }

    func fetchRecent<T: Decodable>(
        fromCollection collection: FirestoreCollection,
        whereQueryIsEqualTo query: CustomQuery
    ) async throws -> [T] {
        calledMethods.insert(.fetchRecent)
        receivedCustomQuery = query
        return [T]()
    }

}
