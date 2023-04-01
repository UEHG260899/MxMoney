//
//  LoginViewModelTests.swift
//  MxMoneyTests
//
//  Created by Uriel Hernandez Gonzalez on 25/03/23.
//

import XCTest
@testable import MxMoney

final class LoginViewModelTests: XCTestCase {

    var sut: LoginViewModel!

    override func setUp() {
        super.setUp()
        sut = LoginViewModel()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_whenInit_emailAndPassword_areEmpty() {
        XCTAssertTrue(sut.email.isEmpty)
        XCTAssertTrue(sut.password.isEmpty)
    }

    func test_whenInit_networkStatus_isNone() {
        XCTAssertEqual(sut.viewStatus, .none)
    }

    func test_whenInit_textsAreInitialized() {
        XCTAssertEqual(sut.texts.headerLabel, "Login.Title.Text")
        XCTAssertEqual(sut.texts.emailLabel, "Login.Email.Text")
        XCTAssertEqual(sut.texts.passwordLabel, "Login.Password.Text")
        XCTAssertEqual(sut.texts.loginButton, "Login.Login.Button")
        XCTAssertEqual(sut.texts.signUpButton, "Login.Signup.Text")
    }

}
