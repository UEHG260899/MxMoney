//
//  FirebaseManager.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 15/05/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class FirebaseManager: FirebaseManagerProtocol {

    func store<T: Encodable>(_ data: T, in collectionName: String, with id: String? = nil) async throws {
        try await withCheckedThrowingContinuation({ (continuation: CheckedContinuation<Void, any Error>) in
            do {
                try Firestore.firestore().collection(collectionName).document(id ?? "").setData(from: data) { error in
                    if let error {
                        continuation.resume(throwing: error)
                        return
                    }

                    continuation.resume()
                }
            } catch {
                continuation.resume(throwing: error)
            }
        })
    }

    func fetch<T: Decodable>(
        fromCollection collection: FirestoreCollection,
        whereQueryIsEqualTo query: CustomQuery
    ) async throws -> [T] {

        return try await withCheckedThrowingContinuation { continuation in
            Firestore.firestore().collection(collection.rawValue)
                .whereField(query.fieldName, isEqualTo: query.filterValue)
                .limit(to: query.limit ?? 5)
                .getDocuments { snapshot, error in
                    if let error {
                        let nsError = error as NSError
                        let description = FirebaseErrorUtilities.getFirestoreErrorDescription(for: nsError)
                        continuation.resume(throwing: AppError.firestore(description))
                        return
                    }

                    guard let snapshot else {
                        continuation.resume(throwing: AppError.firestore("No data was found"))
                        return
                    }

                    let retrievedData = snapshot.documents.compactMap { try? $0.data(as: T.self) }
                    continuation.resume(returning: retrievedData)
                }
        }
    }

    func fetch<T: Decodable>(
        fromCollection collection: FirestoreCollection,
        whereQueryBetween query: BetweenQuery
    ) async throws -> [T] {

        return try await withCheckedThrowingContinuation { continuation in
            Firestore.firestore().collection(collection.rawValue)
                .whereField(query.filterFieldName, isEqualTo: query.filterValue)
                .whereField(query.fieldName, isGreaterThan: query.lowerLimit)
                .whereField(query.fieldName, isLessThan: query.upperLimit)
                .getDocuments { snapshot, error in
                    if let error {
                        let nsError = error as NSError
                        let description = FirebaseErrorUtilities.getFirestoreErrorDescription(for: nsError)
                        continuation.resume(throwing: AppError.firestore(description))
                        return
                    }

                    guard let snapshot else {
                        continuation.resume(throwing: AppError.firestore("No data was found"))
                        return
                    }

                    let retrievedData = snapshot.documents.compactMap { try? $0.data(as: T.self) }
                    continuation.resume(returning: retrievedData)
                }
        }
    }

    func fetchRecent<T: Decodable>(
        fromCollection collection: FirestoreCollection,
        whereQueryIsEqualTo query: CustomQuery
    ) async throws -> [T] {

        return try await withCheckedThrowingContinuation { continuation in
            Firestore.firestore().collection(collection.rawValue)
                .whereField(query.fieldName, isEqualTo: query.filterValue)
                .order(by: "timeStamp", descending: true)
                .limit(to: query.limit ?? 5)
                .getDocuments { snapshot, error in
                    if let error {
                        let nsError = error as NSError
                        let description = FirebaseErrorUtilities.getFirestoreErrorDescription(for: nsError)
                        continuation.resume(throwing: AppError.firestore(description))
                        return
                    }

                    guard let snapshot else {
                        continuation.resume(throwing: AppError.firestore("No data was found"))
                        return
                    }

                    let retrievedData = snapshot.documents.compactMap { try? $0.data(as: T.self) }
                    continuation.resume(returning: retrievedData)
                }
        }
    }
}
