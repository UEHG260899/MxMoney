//
//  HomeBalanceGrid.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 24/05/23.
//

import SwiftUI

struct HomeBalanceGrid: View {

    let transactionsTotal: TransactionsTotal

    var body: some View {
        VStack(spacing: 12) {
            VStack(spacing: 16) {
                Text("Home.Total.Balance.Text")
                    .mxFont(.mxRegular, size: 15)
                    .foregroundColor(.textLightColor)

                Text(transactionsTotal.total.toCurrencyString())
                    .mxFont(.mxBlack, size: 17)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 120)
            .background(Color.cardBackgroundColor)
            .cornerRadius(4)

            HStack(spacing: 12) {
                HomeTransactionCardView(titleLocalizedKey: "Home.Total.Income.Text",
                                        transactionAmount: transactionsTotal.totalIncome)
                HomeTransactionCardView(titleLocalizedKey: "Home.Total.Expense.Text",
                                        transactionAmount: transactionsTotal.totalExpense,
                                        scheme: .defaultExpense)
            }
        }
        .padding(.horizontal, 16)
    }
}

struct HomeBalanceGrid_Previews: PreviewProvider {
    static var previews: some View {
        HomeBalanceGrid(transactionsTotal: .init())
    }
}
