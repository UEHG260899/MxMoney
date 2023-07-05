//
//  HomeServiceProtocol.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 04/07/23.
//

import Foundation

protocol HomeServiceProtocol {
    var screenName: String { get }

    func fetchTransactionsTotal() async throws -> TransactionsTotal 
}
