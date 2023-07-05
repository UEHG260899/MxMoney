//
//  HomeServiceTests.swift
//  MxMoneyTests
//
//  Created by Uriel Hernandez Gonzalez on 04/07/23.
//

import XCTest
@testable import MxMoney

final class HomeServiceTests: XCTestCase {

    var sut: HomeService!
    var mockFirebaseManager: MockFirebaseManager!
    var mockRealmManager: MockRealmManager!

    override func setUp() {
        super.setUp()
        mockFirebaseManager = MockFirebaseManager()
        mockRealmManager = MockRealmManager(taskName: self.name)
        sut = HomeService(firebaseManager: mockFirebaseManager, realmManager: mockRealmManager)
    }

    override func tearDown() {
        sut = nil
        mockFirebaseManager = nil
        mockRealmManager = nil
        super.tearDown()
    }

    func test_screenName_isHomeView() {
        // when
        let expectedScreenName = "HomeView"

        // then
        XCTAssertEqual(sut.screenName, expectedScreenName)
    }

    func test_whenFetchTransactionsTotal_callsIsCacheValid_onRealmManager() async {
        // when
        _ = try? await sut.fetchTransactionsTotal()

        // then
        XCTAssertTrue(mockRealmManager.calledMethods.contains(.isCacheValid))
    }

    func test_whenFetchTransactionsTotal_andCacheIsValid_callsFetch_onRealmManager() async {
        // when
        _ = try? await sut.fetchTransactionsTotal()

        // then
        XCTAssertTrue(mockRealmManager.calledMethods.contains(.fetch))
    }

    func test_whenFetchTransactionsTotal_andCacheIsValid_returnsDefault_whenNoRecords_whereFound() async {
        // when
        let testResults = try? await sut.fetchTransactionsTotal()

        // then
        XCTAssertEqual(testResults?.total, 0)
        XCTAssertEqual(testResults?.totalExpense, 0)
        XCTAssertEqual(testResults?.totalIncome, 0)
    }

    @MainActor // Need to see why it crashes if not executed on Main
    func test_whenFetchTransactionsTotal_andCacheIsValid_returnsCachedElement() async {
        // given
        let testData = TransactionsTotal(total: 200, totalIncome: 300, totalExpense: 100)
        mockRealmManager.save(testData)

        // when
        let recoveredData = try? await sut.fetchTransactionsTotal()

        // then
        XCTAssertEqual(recoveredData?.total, testData.total)
        XCTAssertEqual(recoveredData?.totalExpense, testData.totalExpense)
        XCTAssertEqual(recoveredData?.totalIncome, testData.totalIncome)
    }

    func test_whenFetchTransactionsTotal_andCacheIsInvalid_callsFetchWithBetweenQuery_onFirebaseManager() async {
        // given
        mockRealmManager.isCacheValid = false

        // when
        _ = try? await sut.fetchTransactionsTotal()

        // then
        XCTAssertTrue(mockFirebaseManager.calledMethods.contains(.fetchBetween))
    }

    func test_whenFetchTransactionsTotal_andCacheIsInvalid_returnsPersedData() async {
        // given
        mockRealmManager.isCacheValid = false
        mockFirebaseManager.shouldCompleteWith = .success("200_home_transactions")

        // when
        let receivedData = try? await sut.fetchTransactionsTotal()

        // then
        XCTAssertEqual(receivedData?.total, 200)
        XCTAssertEqual(receivedData?.totalIncome, 400)
        XCTAssertEqual(receivedData?.totalExpense, 200)
    }

    @MainActor
    func test_whenFetchTransactionsTotal_andCacheIsInvalid_storesNewCacheDate_ifTransactionsCanBeParsed() async {
        // given
        mockRealmManager.isCacheValid = false
        mockFirebaseManager.shouldCompleteWith = .success("200_home_transactions")

        // when
        _ = try? await sut.fetchTransactionsTotal()
        let cachedEntity = mockRealmManager.fetch(type: CacheEntity.self).filter("key = %@", sut.screenName)

        // then
        XCTAssertNotNil(cachedEntity.first)
    }
}
