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
        DispatchQueue.main.async {
            try! self.realm.write {
                self.realm.add(object)
            }
        }
    }
}
