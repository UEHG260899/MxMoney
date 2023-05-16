//
//  FirebaseManagerProtocol.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 15/05/23.
//

import Foundation

protocol FirebaseManagerProtocol {
    func store<T: Encodable>(_ data: T) async throws
}
