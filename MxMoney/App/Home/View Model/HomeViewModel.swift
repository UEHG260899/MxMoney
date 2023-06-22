//
//  HomeViewModel.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 24/05/23.
//
// swiftlint:disable line_length

import SwiftUI

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

class HomeViewModel: HomeViewModelProtocol {

    @Published var viewStatus: ViewStatus = .loading
    @Published var transactions = [MoneyTransaction]()
    @Published var transactionsTotal = TransactionsTotal()
    @Published var errorDescription = ""

    let firebaseManager: FirebaseManagerProtocol

    init(firebaseManager: FirebaseManagerProtocol) {
        self.firebaseManager = firebaseManager
    }

    @MainActor
    func fetchData() async {
        guard let userId = UserDefaults.standard.string(forKey: "userId") else {
            viewStatus = .error
            return
        }

        do {
            async let recentTransactions: [MoneyTransaction] = try firebaseManager.fetchRecent(fromCollection: .transactions,
                                                                                               whereQueryIsEqualTo: Queries.recentQuery(userId: userId))

            async let monthlyTransactions: [MoneyTransaction] = try firebaseManager.fetch(fromCollection: .transactions,
                                                                                          whereQueryBetween: Queries.monthlyQuery(userId: userId))

            let (transactions, transactionsFromThisMonth) = try await (recentTransactions, monthlyTransactions)

            self.transactions = transactions
            self.transactionsTotal = calculateTotalTransactions(from: transactionsFromThisMonth)
            viewStatus = .completed
        } catch {
            viewStatus = .error
            handleError(error)
        }
    }

    private func calculateTotalTransactions(from transactions: [MoneyTransaction]) -> TransactionsTotal {
        let totalIncome = transactions.filter { $0.type == .income }.map(\.amount).reduce(0, +)
        let totalExpense = transactions.filter { $0.type == .expense }.map(\.amount).reduce(0, +)
        let total = totalIncome - totalExpense
        return .init(total: total, totalIncome: totalIncome, totalExpense: totalExpense)
    }

    private func handleError(_ error: Error) {
        guard let appError = error as? AppError else {
            return
        }

        if case .firestore(let description) = appError {
            errorDescription = description
        }
    }
}
