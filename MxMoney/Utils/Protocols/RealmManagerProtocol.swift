//
//  RealmManagerProtocol.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 07/05/23.
//

import Foundation
import RealmSwift

protocol RealmManagerProtocol {
    var realm: Realm { get }

    func save<T: Object>(_ object: T)
    func saveObjects<T: Object>(_ objects: [T])
    func fetch<T: Object>(type: T.Type) -> Results<T>
    func isCacheValid(for screen: String) -> Bool
}
