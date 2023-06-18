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
    let timeStamp: TimeInterval
    let userId: String

    var imageName: String {
        switch self.category {
        case .food:
            return "fork.knife.circle"
        case .services:
            return "powerplug"
        case .entertainment:
            return "tv.circle"
        case .shopping:
            return "cart.circle"
        case .miscellaneous:
            return "m.circle"
        }
    }
}

#if DEBUG
extension MoneyTransaction {
    static let mock = MoneyTransaction(title: "Groceries",
                                       category: .food,
                                       type: .expense,
                                       amount: 200,
                                       timeStamp: Date().timeIntervalSince1970,
                                       userId: "Some Id")
}
#endif

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

    var stringValue: String {
        switch self {
        case .food:
            return "Food"
        case .services:
            return "Services"
        case .entertainment:
            return "Entertainment"
        case .shopping:
            return "Shopping"
        case .miscellaneous:
            return "Miscellaneous"
        }
    }
}
