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

    func test_onInit_textsAreInitialized() {
        XCTAssertEqual(sut.texts.titleLabel, "Signup.Title.Text")
        XCTAssertEqual(sut.texts.nameLabel, "Signup.Name.Text")
        XCTAssertEqual(sut.texts.lastNameLabel, "Signup.LastName.Text")
        XCTAssertEqual(sut.texts.emailLabel, "Signup.Email.Text")
        XCTAssertEqual(sut.texts.passwordLabel, "Signup.Password.Text")
        XCTAssertEqual(sut.texts.confirmPasswordLabel, "Signup.Confirm.Password.Text")
        XCTAssertEqual(sut.texts.signUpButton, "Signup.Signup.Button")
        XCTAssertEqual(sut.texts.errorAlertTitle, "Error.Alert.Title.Text")
    }

    func test_onInit_isErrorPresent_isSetTo_False() {
        XCTAssertFalse(sut.isErrorPresent)
    }

    func test_whenViewStatus_changesToError_isErrorPresent_isTrue() {
        // when
        sut.viewStatus = .error

        // then
        XCTAssertTrue(sut.isErrorPresent)
    }

    func test_whenViewStatus_isNotError_isErrorPresent_isFalse() {
        // when
        sut.viewStatus = .none

        XCTAssertFalse(sut.isErrorPresent)
    }

}
