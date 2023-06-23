//
//  CacheEntity.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 22/06/23.
//

import Foundation
import RealmSwift

class CacheEntity: Object {
    @Persisted(primaryKey: true) var key: String
    @Persisted var expireDate: Date
}
