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

    func save<T: Object>(_ object: T) {
        DispatchQueue.main.async {
            try! self.realm.write { [weak self] in
                guard let self else { return }

                guard T.primaryKey() != nil else {
                    self.realm.add(object, update: .modified)
                    return
                }

                self.realm.add(object)
            }
        }
    }

    func saveObjects<T: Object>(_ objects: [T]) {
        DispatchQueue.main.async {
            try! self.realm.write { [weak self] in
                guard let self else { return }

                guard T.primaryKey() != nil else {
                    self.realm.add(objects, update: .modified)
                    return
                }

                self.realm.add(objects)
            }
        }
    }

    func fetch<T: Object>(type: T.Type) -> Results<T> {
        return realm.objects(type)
    }

    func isCacheValid(for screen: String) -> Bool {
        let entities = fetch(type: CacheEntity.self).filter("key = %@", screen)

        guard let entity = entities.first else {
            return false
        }

        return Date() < entity.expireDate
    }
}
