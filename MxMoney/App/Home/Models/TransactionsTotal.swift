//
//  TransactionsTotal.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 20/06/23.
//

import Foundation
import RealmSwift

class TransactionsTotal: Object {
    @Persisted var total: Double = 0
    @Persisted var totalIncome: Double = 0
    @Persisted var totalExpense: Double = 0

    override init() {}

    init(total: Double = 0, totalIncome: Double = 0, totalExpense: Double = 0) {
        super.init()
        self.total = total
        self.totalIncome = totalIncome
        self.totalExpense = totalExpense
    }
}
