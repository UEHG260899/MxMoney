//
//  MockRealmManager.swift
//  MxMoneyTests
//
//  Created by Uriel Hernandez Gonzalez on 07/05/23.
// swiftlint:disable force_try

import Foundation
import RealmSwift
@testable import MxMoney

class MockRealmManager: RealmManagerProtocol {

    struct CalledMethods: OptionSet {
        let rawValue: Int

        static let save = CalledMethods(rawValue: 1 << 0)
    }

    let realm: Realm = try! Realm()
    var calledMethods: CalledMethods = []
    var receivedData: Object?

    func save(_ object: Object) {
        calledMethods.insert(.save)
        receivedData = object
    }
}
