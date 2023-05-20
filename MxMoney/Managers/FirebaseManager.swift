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
}
