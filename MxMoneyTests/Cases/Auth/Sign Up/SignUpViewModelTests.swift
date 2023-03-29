//
//  SignUpViewModelTests.swift
//  MxMoneyTests
//
//  Created by Uriel Hernandez Gonzalez on 28/03/23.
//

import XCTest
@testable import MxMoney

final class SignUpViewModelTests: XCTestCase {

    var sut: SignUpViewModel!

    override func setUp() {
        super.setUp()
        sut = SignUpViewModel()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_onInit_formDataIsEmpty() {
        XCTAssertTrue(sut.formData.firstName.isEmpty)
        XCTAssertTrue(sut.formData.lastName.isEmpty)
        XCTAssertTrue(sut.formData.email.isEmpty)
        XCTAssertTrue(sut.formData.password.isEmpty)
        XCTAssertTrue(sut.formData.confirmPassword.isEmpty)
    }

    func test_onInit_viewStatus_inNone() {
        XCTAssertEqual(sut.viewStatus, .none)
    }

}
