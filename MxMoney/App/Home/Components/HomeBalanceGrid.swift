//
//  HomeBalanceGrid.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 24/05/23.
//

import SwiftUI

struct HomeBalanceGrid: View {
    var body: some View {
        VStack(spacing: 12) {
            VStack(spacing: 16) {
                Text("TOTAL BALANCE")
                    .mxFont(.mxRegular, size: 15)
                    .foregroundColor(.textLightColor)

                Text("$23,000")
                    .mxFont(.mxBlack, size: 17)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 120)
            .background(Color.cardBackgroundColor)
            .cornerRadius(4)

            HStack(spacing: 12) {
                HomeTransactionCardView()
                HomeTransactionCardView(scheme: .defaultExpense)
            }
        }
        .padding(.horizontal, 16)
    }
}

struct HomeBalanceGrid_Previews: PreviewProvider {
    static var previews: some View {
        HomeBalanceGrid()
    }
}
