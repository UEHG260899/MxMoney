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

    func save(_ object: Object)
}
