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

}
