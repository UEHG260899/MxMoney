//
//  HomeService.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 04/07/23.
//

import Foundation

private enum Queries {
    static func recentQuery(userId: String) -> CustomQuery {
        return .init(fieldName: "userId", filterValue: userId)
    }

    static func monthlyQuery(userId: String) -> BetweenQuery {
        let (lowerTimeInterval, upperTimeInterval) = TimeInterval.fromStartAndEndOfMonth()

        return .init(filterFieldName: "userId",
                     filterValue: userId,
                     fieldName: "timeStamp",
                     lowerLimit: lowerTimeInterval,
                     upperLimit: upperTimeInterval)
    }
}

struct HomeService: HomeServiceProtocol {

    private let firebaseManager: FirebaseManagerProtocol
    private let realmManager: RealmManagerProtocol

    let screenName = "HomeView"

    init(firebaseManager: FirebaseManagerProtocol, realmManager: RealmManagerProtocol) {
        self.firebaseManager = firebaseManager
        self.realmManager = realmManager
    }

    @MainActor
    func fetchTransactionsTotal() async throws -> TransactionsTotal {
        if realmManager.isCacheValid(for: screenName) {
            return fetchTransactionsTotalFromCache()
        }

        guard let userId = UserDefaults.standard.string(forKey: "userId") else {
            return .init()
        }

        let transactions: [MoneyTransaction] = try await firebaseManager.fetch(fromCollection: .transactions,
                                                                               whereQueryBetween: Queries.monthlyQuery(userId: userId))
        let totals = transform(transactions)
        let lastCacheRefresh = CacheEntity(key: screenName)
        realmManager.save(lastCacheRefresh)
        return totals
    }

    private func fetchTransactionsTotalFromCache() -> TransactionsTotal {
        return realmManager.fetch(type: TransactionsTotal.self).first ?? .init()
    }

    private func transform(_ transactions: [MoneyTransaction]) -> TransactionsTotal {
        let totalIncome = transactions.filter { $0.type == .income }.map(\.amount).reduce(0, +)
        let totalExpense = transactions.filter { $0.type == .expense }.map(\.amount).reduce(0, +)
        let total = totalIncome - totalExpense
        return .init(total: total, totalIncome: totalIncome, totalExpense: totalExpense)
    }
}
