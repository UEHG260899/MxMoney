//
//  MoneyTransaction.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 08/06/23.
//

import Foundation

struct MoneyTransaction: Codable, Identifiable {
    var id: String = UUID().uuidString
    let title: String
    let category: TransactionCategory
    let type: TransactionType
    let amount: Double
    let date: String
    let userId: String
}

enum TransactionType: String, Codable {
    case income
    case expense
}

enum TransactionCategory: Int, Codable {
    case food
    case services
    case entertainment
    case shopping
    case miscellaneous
}
