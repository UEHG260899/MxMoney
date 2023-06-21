//
//  HomeViewModelProtocol.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 24/05/23.
//

import SwiftUI

protocol HomeViewModelProtocol: ObservableObject {
    var viewStatus: ViewStatus { get set }
    var transactions: [MoneyTransaction] { get }
    var transactionsTotal: TransactionsTotal { get }
    func fetchData() async
}
