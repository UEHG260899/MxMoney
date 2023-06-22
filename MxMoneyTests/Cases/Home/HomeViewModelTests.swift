//
//  HomeViewModelTests.swift
//  MxMoneyTests
//
//  Created by Uriel Hernandez Gonzalez on 04/06/23.
//
// swiftlint:disable force_cast

import XCTest
@testable import MxMoney

final class HomeViewModelTests: XCTestCase {

    var sut: HomeViewModel!
    var mockFirebaseManager: MockFirebaseManager!

    override func setUp() {
        super.setUp()
        mockFirebaseManager = MockFirebaseManager()
        sut = HomeViewModel(firebaseManager: mockFirebaseManager)
    }

    override func tearDown() {
        sut = nil
        mockFirebaseManager = nil
        super.tearDown()
    }

    func test_onInit_firebaseManager_isSet() {
        XCTAssertNotNil(sut.firebaseManager)
    }

    func test_onInit_viewStatus_isLoading() {
        XCTAssertEqual(sut.viewStatus, .loading)
    }

    func test_onInit_transactions_areEmpty() {
        XCTAssertEqual(sut.transactions.count, 0)
    }

    func test_onInit_transactionsTotalValues_areEqual_to0() {
        [sut.transactionsTotal.total, sut.transactionsTotal.totalExpense, sut.transactionsTotal.totalIncome].forEach {
            XCTAssertEqual($0, 0)
        }
    }

    func test_whenFetchData_callsFetchRecent_onFirebaseManager_andSendsCorrectQuery() async {
        // given
        let userId = UserDefaults.standard.string(forKey: "userId")
        let testQuery = CustomQuery(fieldName: "userId", filterValue: userId ?? "")

        // when
        await sut.fetchData()

        // then
        XCTAssertTrue(mockFirebaseManager.calledMethods.contains(.fetchRecent))
        XCTAssertEqual(testQuery.filterValue as! String,
                       (mockFirebaseManager.receivedCustomQuery?.filterValue as! String))
        XCTAssertEqual(testQuery.fieldName, mockFirebaseManager.receivedCustomQuery?.fieldName)
    }

    func test_whenFetchData_callsFetchRecent_andCompletes_withError_viewState_isError() async {
        // when
        await sut.fetchData()

        // then
        XCTAssertEqual(sut.viewStatus, .error)
    }

    func test_whenFetchData_callsFetchRecent_andCompletes_withSuccess_viewState_isCompleted_andTransactions_areSet() async {
        // given
        let expectedTransactionsCount = 3
        mockFirebaseManager.shouldCompleteWith = .success("200_home_transactions")

        // when
        await sut.fetchData()

        // then
        XCTAssertEqual(sut.viewStatus, .completed)
        XCTAssertEqual(sut.transactions.count, expectedTransactionsCount)
    }

    func test_whenFetchData_callsFetchBetween_onFirebaseManager() async {
        // when
        await sut.fetchData()

        // then
        XCTAssertTrue(mockFirebaseManager.calledMethods.contains(.fetchBetween))
    }

    func test_whenFetchData_callsFetchBetween_andCompletes_withError_viewState_isError() async {
        // when
        await sut.fetchData()

        // then
        XCTAssertEqual(sut.viewStatus, .error)
    }

    func test_whenFetchData_callsFetchBetween_andCompletes_withSuccess_viewState_isCompleted_andTransactionsTotal_isSet() async {
        // given
        mockFirebaseManager.shouldCompleteWith = .success("200_home_transactions")

        // when
        await sut.fetchData()

        // then
        XCTAssertEqual(sut.viewStatus, .completed)
        XCTAssertEqual(sut.transactionsTotal.total, 200)
        XCTAssertEqual(sut.transactionsTotal.totalIncome, 400)
        XCTAssertEqual(sut.transactionsTotal.totalExpense, 200)
    }
}
