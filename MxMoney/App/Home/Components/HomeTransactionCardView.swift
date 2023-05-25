//
//  HomeTransactionCardView.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 24/05/23.
//

import SwiftUI

struct HomeTransactionCardView: View {

    var scheme: HomeTransactionCardViewScheme = .defaultIncome

    var body: some View {
        Button(action: { print("Hello") }) {
            VStack(alignment: scheme.mainHorizontalAlignment, spacing: scheme.mainVerticalSpacing) {
                Image(scheme.imageName)
                    .resizable()
                    .frame(width: scheme.imageSize.width, height: scheme.imageSize.height)
                    .padding([.top, .trailing], scheme.imagePadding)

                VStack(alignment: scheme.textHorizontalAlignment, spacing: scheme.textVerticalSpacing) {
                    Text("TOTAL INCOME")
                        .mxFont(scheme.titleFont, size: scheme.titleFontSize)
                        .foregroundColor(scheme.titleFontColor)

                    Text("+$23,000")
                        .mxFont(scheme.descriptionFont, size: scheme.descriptionFontSize)
                        .foregroundColor(scheme.descriptionFontColor)
                }
                .frame(maxWidth: scheme.textMaxWidth, alignment: scheme.textFrameAlignment)
                .padding(.leading, scheme.textLeadingPadding)
                .padding(.bottom, scheme.textBottomPadding)
            }
            .frame(maxWidth: scheme.cardMaxWidth)
            .background(scheme.cardBackgroundColor)
            .cornerRadius(scheme.cardCornerRadius)
        }
    }
}

struct HomeTransactionCardView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTransactionCardView()
    }
}
