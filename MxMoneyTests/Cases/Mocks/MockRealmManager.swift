//
//  MockRealmManager.swift
//  MxMoneyTests
//
//  Created by Uriel Hernandez Gonzalez on 07/05/23.
// swiftlint:disable force_try
// swiftlint:disable force_cast

import Foundation
import RealmSwift
@testable import MxMoney

class MockRealmManager: RealmManagerProtocol {

    struct CalledMethods: OptionSet {
        let rawValue: Int

        static let save = CalledMethods(rawValue: 1 << 0)
        static let isCacheValid = CalledMethods(rawValue: 1 << 1)
        static let fetch = CalledMethods(rawValue: 1 << 2)
    }

    let realm: Realm
    var calledMethods: CalledMethods = []
    var receivedData: Object?
    var isCacheValid = true

    init(taskName: String) {
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = taskName
        self.realm = try! Realm()
    }

    func save<T: Object>(_ object: T) {
        calledMethods.insert(.save)
        receivedData = object
        try! realm.write {
            realm.add(object)
        }
    }

    func saveObjects<T: Object>(_ objects: [T]) {
    }

    func fetch<T: Object>(type: T.Type) -> Results<T> {
        calledMethods.insert(.fetch)
        return realm.objects(type)
    }

    func isCacheValid(for screen: String) -> Bool {
        calledMethods.insert(.isCacheValid)
        return isCacheValid
    }
}
