//
//  HomeViewModelTests.swift
//  MxMoneyTests
//
//  Created by Uriel Hernandez Gonzalez on 04/06/23.
//

import XCTest
@testable import MxMoney

final class HomeViewModelTests: XCTestCase {

    var sut: HomeViewModel!

    override func setUp() {
        super.setUp()
        sut = HomeViewModel(firebaseManager: MockFirebaseManager())
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_onInit_firebaseManager_isSet() {
        XCTAssertNotNil(sut.firebaseManager)
    }

    func test_onInit_viewStatus_isLoading() {
        XCTAssertEqual(sut.viewStatus, .loading)
    }
}
