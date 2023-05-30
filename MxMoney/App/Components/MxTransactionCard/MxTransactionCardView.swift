//
//  MxTransactionCardView.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 29/05/23.
//

import SwiftUI

struct MxTransactionCardView: View {

    var scheme: MxTransportCardViewScheme = .income

    var body: some View {
        HStack(spacing: scheme.mainHorizontalSpacing) {
            Image(systemName: "house")
                .resizable()
                .frame(width: scheme.imageSize.width, height: scheme.imageSize.height)
                .padding(scheme.imagePadding)
                .foregroundColor(scheme.imageForegroundColor)
                .background(scheme.imageBackgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: scheme.imageCornerRadius))

            VStack(alignment: scheme.transactionHorizontalAlignment, spacing: scheme.transactionVerticalSpacing) {
                Text("Metro Railway")
                    .mxFont(scheme.transactionTitleFont, size: scheme.transactionTitleFontSize)
                    .foregroundColor(scheme.transactionTitleColor)

                Text("Transportation")
                    .mxFont(scheme.transactionTypeFont, size: scheme.transactionTypeFontSize)
                    .foregroundColor(scheme.transactionTypeColor)
            }
            .frame(maxWidth: .infinity, alignment: scheme.transactionFrameAlignment)

            VStack(alignment: scheme.detailsHorizontalAlignment, spacing: scheme.detailsVerticalSpacing) {
                Text("+$30.00")
                    .mxFont(scheme.detailsTitleFont, size: scheme.detailsTitleFontSize)
                    .foregroundColor(scheme.detailsTitleFontColor)

                Text("Oct 30, 2021")
                    .mxFont(scheme.detailsDateFont, size: scheme.detailsDateFontSize)
                    .foregroundColor(scheme.detailsDateFontColor)
            }

        }
        .padding(scheme.mainPadding)
        .background {
            scheme.mainBackgroundColor
        }
        .clipShape(RoundedRectangle(cornerRadius: scheme.mainCornerRadius))
    }
}

struct MxTransactionCardView_Previews: PreviewProvider {

    static let devices = ["iPhone SE (3rd generation)", "iPhone 11", "iPhone 14 Pro Max"]

    static var previews: some View {
        ForEach(devices, id: \.self) { device in
            VStack {
                MxTransactionCardView()
                MxTransactionCardView(scheme: .expense)
            }
            .previewDevice(PreviewDevice(rawValue: device))
            .previewDisplayName(device)
        }
    }
}
