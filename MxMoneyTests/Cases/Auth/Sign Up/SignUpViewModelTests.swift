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
    var mockAuthManager: MockAuthManager!
    var mockRealmManager: MockRealmManager!

    override func setUp() {
        super.setUp()
        mockAuthManager = MockAuthManager()
        mockRealmManager = MockRealmManager()
        sut = SignUpViewModel(
            authManager: mockAuthManager,
            realmManager: mockRealmManager
        )
    }

    override func tearDown() {
        mockAuthManager = nil
        mockRealmManager = nil
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

    func test_onInit_authManager_isSet() {
        XCTAssertNotNil(sut.authManager)
    }

    func test_onInit_realmManager_isSet() {
        XCTAssertNotNil(sut.realmManager)
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

    func test_attemptToCreateUser_setsViewStatus_toLoading_whenCalled() {
        // when
        sut.attemptToCreateUser()

        // then
        XCTAssertEqual(sut.viewStatus, .loading)
    }

    func test_attemptToCreateUser_callsRegister_onAuthManager() {
        // when
        sut.attemptToCreateUser()

        // then
        XCTAssertTrue(mockAuthManager.calledMethods.contains(.register))
    }

    func test_attemptToCreateUser_sendsEmail_andPassword_fromFormDataValues() {
        // given
        sut.formData.email = "uriel@gmail.com"
        sut.formData.password = "SomePassword"

        // when
        sut.attemptToCreateUser()

        // then
        XCTAssertEqual(mockAuthManager.receivedEmail, sut.formData.email)
        XCTAssertEqual(mockAuthManager.receivedPassword, sut.formData.password)
    }

    func test_attemptToCreateUser_changesViewState_toError_whenCompletionReturnsError() {
        // given
        let error: AppError = .authentication("Some description")
        mockAuthManager.shouldCompleteWith = .failure(error)

        // when
        sut.attemptToCreateUser()

        // then
        XCTAssertEqual(sut.viewStatus, .error)
    }

    func test_attemptToCreateUser_setsErrorDescription_whenCompletionReturnsError() {
        // given
        let error: AppError = .authentication("Some description")
        mockAuthManager.shouldCompleteWith = .failure(error)

        // when
        sut.attemptToCreateUser()

        // then
        XCTAssertEqual(sut.errorDescription, "Some description")
    }

    func test_attemptToCreateUser_setsViewStatus_toCompleted_whenCmpletionReturnsSuccess() {
        // given
        mockAuthManager.shouldCompleteWith = .success("")

        // when
        sut.attemptToCreateUser()

        // then
        XCTAssertEqual(sut.viewStatus, .completed)
    }

    func test_attemptToCreateUser_callsSave_onRealmManager_whenCompletionReturnsSuccess() {
        // given
        mockAuthManager.shouldCompleteWith = .success("")

        // when
        sut.attemptToCreateUser()

        // then
        XCTAssertTrue(mockRealmManager.calledMethods.contains(.save))
    }

    func test_attemptToCreateUser_sendsCorrectInfo_toRealmManager_whenCompletionReturnsSuccess() {
        // given
        sut.formData.firstName = "Uriel"
        sut.formData.lastName = "Hernandez"
        sut.formData.email = "uriel@gmail.com"

        mockAuthManager.shouldCompleteWith = .success("Some id")

        // when
        sut.attemptToCreateUser()
        let user = mockRealmManager.receivedData as? User

        // then
        XCTAssertEqual(user?.id, "Some id")
        XCTAssertEqual(user?.firstName, sut.formData.firstName)
        XCTAssertEqual(user?.lastName, sut.formData.lastName)
        XCTAssertEqual(user?.email, sut.formData.email)
    }

}
