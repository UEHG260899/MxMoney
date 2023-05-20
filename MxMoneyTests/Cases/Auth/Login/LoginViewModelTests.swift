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
    var mockAuthManager: MockAuthManager!

    override func setUp() {
        super.setUp()
        mockAuthManager = MockAuthManager()
        sut = LoginViewModel(authManager: mockAuthManager)
    }

    override func tearDown() {
        mockAuthManager = nil
        sut = nil
        super.tearDown()
    }

    func test_onInit_formData_isEmpty() {
        XCTAssertTrue(sut.formData.email.isEmpty)
        XCTAssertTrue(sut.formData.password.isEmpty)
    }

    func test_onInit_networkStatus_isNone() {
        XCTAssertEqual(sut.viewStatus, .none)
    }

    func test_onInit_textsAreInitialized() {
        XCTAssertEqual(sut.texts.headerLabel, "Login.Title.Text")
        XCTAssertEqual(sut.texts.emailLabel, "Login.Email.Text")
        XCTAssertEqual(sut.texts.passwordLabel, "Login.Password.Text")
        XCTAssertEqual(sut.texts.loginButton, "Login.Login.Button")
        XCTAssertEqual(sut.texts.signUpButton, "Login.Signup.Text")
        XCTAssertEqual(sut.texts.errorAlertTitle, "Error.Alert.Title.Text")
    }

    func test_onInit_isErrorPresent_hasFalseValue() {
        XCTAssertFalse(sut.isErrorPresent)
    }

    func test_onInit_authManager_isSet() {
        XCTAssertNotNil(sut.authManager)
    }

    func test_whenViewStatusIsError_isErrorPresent_isSetTo_True() {
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

    func test_attemptToLogin_setsViewStatus_toLoading() async {
        // when
        await sut.attemptToLogin()

        // then
        XCTAssertEqual(sut.viewStatus, .loading)
    }

    func test_attemptToLogin_callsLogin_onAuthManager() async {
        // when
        await sut.attemptToLogin()

        // then
        XCTAssertTrue(mockAuthManager.calledMethods.contains(.login))
    }

    func test_attemptToLogin_sendsFormData_toAuthManager() async {
        // given
        sut.formData.email = "uriel@gmail"
        sut.formData.password = "password"

        // when
        await sut.attemptToLogin()

        // then
        XCTAssertEqual(mockAuthManager.receivedEmail, sut.formData.email)
        XCTAssertEqual(mockAuthManager.receivedPassword, sut.formData.password)
    }

    func test_attemptToLogin_setsViewState_toError_whenLoginFails() async {
        // given
        let testError: AppError = .authentication("Some Error")
        mockAuthManager.shouldCompleteWith = .failure(testError)

        // when
        await sut.attemptToLogin()

        // then
        XCTAssertEqual(sut.viewStatus, .error)
    }

    func test_attemptToLogin_setsErrorDescription_toOneReceivedByError_whenLoginFails() async {
        // given
        let testError: AppError = .authentication("Some Error")
        mockAuthManager.shouldCompleteWith = .failure(testError)

        // when
        await sut.attemptToLogin()

        // then
        XCTAssertEqual(sut.errorDescription, "Some Error")
    }

}
