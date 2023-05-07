//
//  FirebaseErrorUtilitiesTests.swift
//  MxMoneyTests
//
//  Created by Uriel Hernandez Gonzalez on 06/05/23.
//

import XCTest
@testable import MxMoney

final class FirebaseErrorUtilitiesTests: XCTestCase {

    private func testError(code: Int) -> NSError {
        return NSError(domain: "com.MxMoney", code: code)
    }

    func test_getAuthErrorDescription_returnsDefaultErrorText_whenErrorIsntAuthError() {
        // when
        let description = FirebaseErrorUtilities.getAuthErrorDescription(for: testError(code: 8272190372973))

        // then
        XCTAssertEqual(description, "Algo misterioso pasó")
    }

    func test_getAuthErrorDescription_returnsNetworkErrorText_whenErrorCodeIs17020() {
        // when
        let description = FirebaseErrorUtilities.getAuthErrorDescription(for: testError(code: 17020))

        // then
        XCTAssertEqual(description, "Ocurrió un error de red, intentalo de nuevo más tarde")
    }

    func test_getAuthErrorDescription_returnsInvalidEmailText_whenErrorCodeIs17008() {
        // when
        let description = FirebaseErrorUtilities.getAuthErrorDescription(for: testError(code: 17008))

        // then
        XCTAssertEqual(description, "El email no es válido")
    }

    func test_getAuthErrorDescription_returnsUserDisabledText_whenErrorCodeIs17005() {
        // when
        let description = FirebaseErrorUtilities.getAuthErrorDescription(for: testError(code: 17005))

        // then
        XCTAssertEqual(description, "El usuario esta deshabilitado")
    }

    func test_getAuthErrorDescription_returnsEmailAlreadyInUseText_whenErrorCodeIs17007() {
        // when
        let description = FirebaseErrorUtilities.getAuthErrorDescription(for: testError(code: 17007))

        // then
        XCTAssertEqual(description, "Ya existe una cuenta con el email introducido")
    }

    func test_getAuthErrorDescription_returnsWeakPasswordTextText_whenErrorCodeIs17026() {
        // when
        let description = FirebaseErrorUtilities.getAuthErrorDescription(for: testError(code: 17026))

        // then
        XCTAssertEqual(description, "La contraseña debe de contener al menos 6 caracteres")
    }

    func test_getAuthErrorDescription_returnsWrongPassword_whenErrorCodeIs17009() {
        // when
        let description = FirebaseErrorUtilities.getAuthErrorDescription(for: testError(code: 17009))

        // then
        XCTAssertEqual(description, "El email o la contraseña son incorrectos")
    }

}
