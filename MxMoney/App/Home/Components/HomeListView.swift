//
//  HomeListView.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 29/05/23.
//

import SwiftUI

struct HomeListView: View {

    let transactions: [MoneyTransaction]

    var body: some View {
        VStack(alignment: .leading, spacing: 42) {
            Text("Recent Transactions")
                .mxFont(.mxBold, size: 17)
                .foregroundColor(.textWhiteColor)
                .padding(.leading, 8)

            LazyVStack(spacing: 12) {
                ForEach(transactions) { transaction in
                    MxTransactionCardView(moneyTransaction: transaction)
                }
            }
        }
        .padding(.horizontal, 16)
    }
}

struct HomeListView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.mainColor
                .ignoresSafeArea()

            HomeListView(transactions: [MoneyTransaction]())
        }
    }
}
