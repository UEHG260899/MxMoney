//
//  User.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 07/05/23.
//

import Foundation
import RealmSwift

class User: Object, Codable {
    @Persisted(primaryKey: true) var id: String
    @Persisted var firstName: String
    @Persisted var lastName: String
    @Persisted var email: String

    override init() {}

    init(
        id: String,
        firstName: String,
        lastName: String,
        email: String
    ) {
        super.init()
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
    }
}
