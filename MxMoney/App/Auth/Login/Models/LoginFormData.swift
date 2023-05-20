//
//  LoginFormData.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 20/05/23.
//

import Foundation

struct LoginFormData {
    var email = ""
    var password = ""

    func fieldsAreEmpty() -> Bool {
        return email.isEmpty || password.isEmpty
    }
}
