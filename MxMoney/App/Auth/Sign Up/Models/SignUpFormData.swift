//
//  SignUpFormData.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 28/03/23.
//
// swiftlint:disable force_try

import Foundation

struct SignUpFormData {
    var firstName = ""
    var lastName = ""
    var email = ""
    var password = ""
    var confirmPassword = ""

    func isInvalid() -> Bool {
        return fieldsAreEmpty() || namesContainNumbers()
    }

    private func fieldsAreEmpty() -> Bool {
        return firstName.isEmpty || lastName.isEmpty
                || email.isEmpty || password.isEmpty || confirmPassword.isEmpty
    }

    private func namesContainNumbers() -> Bool {
        let numbersRegEx = try! Regex("[0-9]+")
        return firstName.contains(numbersRegEx) || lastName.contains(numbersRegEx)
    }
}
