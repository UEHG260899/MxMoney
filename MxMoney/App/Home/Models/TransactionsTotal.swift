//
//  TransactionsTotal.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 20/06/23.
//

import Foundation

struct TransactionsTotal {
    let total: Double
    let totalIncome: Double
    let totalExpense: Double

    init(total: Double = 0, totalIncome: Double = 0, totalExpense: Double = 0) {
        self.total = total
        self.totalIncome = totalIncome
        self.totalExpense = totalExpense
    }
}
