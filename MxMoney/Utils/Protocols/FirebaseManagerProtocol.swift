//
//  FirebaseManagerProtocol.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 15/05/23.
//

import Foundation

protocol FirebaseManagerProtocol {
    func store<T: Encodable>(_ data: T, in collectionName: String, with id: String?) async throws

    func fetch<T: Decodable>(
        fromCollection collection: FirestoreCollection,
        whereQueryIsEqualTo query: CustomQuery
    ) async throws -> [T]

    func fetch<T: Decodable>(
        fromCollection collection: FirestoreCollection,
        whereQueryBetween query: BetweenQuery
    ) async throws -> [T]

    func fetchRecent<T: Decodable>(
        fromCollection collection: FirestoreCollection,
        whereQueryIsEqualTo query: CustomQuery
    ) async throws -> [T]
}
