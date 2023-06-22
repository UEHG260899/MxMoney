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
        static let fetchBetween = CalledMethods(rawValue: 1 << 3)
        static let fetchRecent = CalledMethods(rawValue: 1 << 2)
    }

    var calledMethods: CalledMethods = []
    var receivedCollectionName: String?
    var receivedId: String?
    var receivedCustomQuery: CustomQuery?
    var shouldCompleteWith: Result<String, AppError> = .failure(.testing("Something failed"))

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

        switch shouldCompleteWith {
        case .success(let fileName):

            if let decodedData: [T] = getDataFromFile(fileName) {
                return decodedData
            }

            throw AppError.testing("Some error")
        case .failure(let error):
            throw error
        }
    }

    func fetch<T: Decodable>(
        fromCollection collection: FirestoreCollection,
        whereQueryBetween query: BetweenQuery
    ) async throws -> [T] {

        calledMethods.insert(.fetchBetween)

        switch shouldCompleteWith {
        case .success(let fileName):

            if let decodedData: [T] = getDataFromFile(fileName) {
                return decodedData
            }

            throw AppError.testing("Some error")
        case .failure(let error):
            throw error
        }
    }

    func fetchRecent<T: Decodable>(
        fromCollection collection: FirestoreCollection,
        whereQueryIsEqualTo query: CustomQuery
    ) async throws -> [T] {
        calledMethods.insert(.fetchRecent)
        receivedCustomQuery = query

        switch shouldCompleteWith {
        case .success(let fileName):

            if let decodedData: [T] = getDataFromFile(fileName) {
                return decodedData
            }

            throw AppError.testing("Some error")
        case .failure(let error):
            throw error
        }
    }

    private func getDataFromFile<T: Decodable>(_ fileName: String) -> [T]? {
        let filePath = Bundle.testing.path(forResource: fileName, ofType: "json") ?? ""
        let data = try? Data(contentsOf: URL(filePath: filePath))
        let decodedData = try? JSONDecoder().decode([T].self, from: data ?? Data())
        return decodedData
    }

}
