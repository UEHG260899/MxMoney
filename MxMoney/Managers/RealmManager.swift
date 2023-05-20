//
//  RealmManager.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 07/05/23.
//
// swiftlint:disable force_try

import Foundation
import RealmSwift

class RealmManager: RealmManagerProtocol {
    let realm = try! Realm()

    func save(_ object: Object) {
        try! realm.write {
            realm.add(object)
        }
    }
}
