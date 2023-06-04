//
//  HomeTransactionCardViewScheme.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 24/05/23.
//

import SwiftUI

struct HomeTransactionCardViewScheme {
    var mainHorizontalAlignment: HorizontalAlignment
    var mainVerticalSpacing: Double
    var imageName: String
    var imageSize: CGSize
    var imagePadding: Double
    var textHorizontalAlignment: HorizontalAlignment
    var textVerticalSpacing: Double
    var titleFont: MxFont
    var titleFontSize: Double
    var titleFontColor: Color
    var descriptionFont: MxFont
    var descriptionFontSize: Double
    var descriptionFontColor: Color
    var textMaxWidth: Double
    var textFrameAlignment: Alignment
    var textLeadingPadding: Double
    var textBottomPadding: Double
    var cardMaxWidth: Double
    var cardBackgroundColor: Color
    var cardCornerRadius: Double
}

extension HomeTransactionCardViewScheme {
    static let defaultIncome = HomeTransactionCardViewScheme(
        mainHorizontalAlignment: .trailing,
        mainVerticalSpacing: 9,
        imageName: "income.icon",
        imageSize: .init(width: 32, height: 32),
        imagePadding: 12,
        textHorizontalAlignment: .leading,
        textVerticalSpacing: 12,
        titleFont: .mxRegular,
        titleFontSize: 15,
        titleFontColor: .textLightColor,
        descriptionFont: .mxBlack,
        descriptionFontSize: 17,
        descriptionFontColor: .white,
        textMaxWidth: .infinity,
        textFrameAlignment: .leading,
        textLeadingPadding: 21,
        textBottomPadding: 20,
        cardMaxWidth: .infinity,
        cardBackgroundColor: .cardBackgroundColor,
        cardCornerRadius: 4
    )

    static let defaultExpense = HomeTransactionCardViewScheme(
        mainHorizontalAlignment: .trailing,
        mainVerticalSpacing: 9,
        imageName: "expense.icon",
        imageSize: .init(width: 32, height: 32),
        imagePadding: 12,
        textHorizontalAlignment: .leading,
        textVerticalSpacing: 12,
        titleFont: .mxRegular,
        titleFontSize: 15,
        titleFontColor: .textLightColor,
        descriptionFont: .mxBlack,
        descriptionFontSize: 17,
        descriptionFontColor: .white,
        textMaxWidth: .infinity,
        textFrameAlignment: .leading,
        textLeadingPadding: 21,
        textBottomPadding: 20,
        cardMaxWidth: .infinity,
        cardBackgroundColor: .cardBackgroundColor,
        cardCornerRadius: 4
    )
}
