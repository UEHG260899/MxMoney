//
//  MxTransactionCardViewScheme.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 29/05/23.
//

import SwiftUI

struct MxTransportCardViewScheme {
    var mainHorizontalSpacing: CGFloat
    var mainPadding: CGFloat
    var mainBackgroundColor: Color
    var mainCornerRadius: CGFloat

    // MARK: Icon
    var imageSize: CGSize
    var imagePadding: CGFloat
    var imageForegroundColor: Color
    var imageBackgroundColor: Color
    var imageCornerRadius: CGFloat

    // MARK: Transaction
    var transactionHorizontalAlignment: HorizontalAlignment
    var transactionVerticalSpacing: CGFloat
    var transactionTitleFont: MxFont
    var transactionTitleFontSize: CGFloat
    var transactionTitleColor: Color
    var transactionTypeFont: MxFont
    var transactionTypeFontSize: CGFloat
    var transactionTypeColor: Color
    var transactionFrameAlignment: Alignment

    // MARK: Details
    var detailsHorizontalAlignment: HorizontalAlignment
    var detailsVerticalSpacing: CGFloat
    var detailsTitleFont: MxFont
    var detailsTitleFontSize: CGFloat
    var detailsDateFont: MxFont
    var detailsDateFontSize: CGFloat
    var detailsDateFontColor: Color

    init(
        mainHorizontalSpacing: CGFloat = 17,
        mainPadding: CGFloat = 12,
        mainBackgroundColor: Color = .cardBackgroundColor,
        mainCornerRadius: CGFloat = 4,
        imageSize: CGSize = .init(width: 24, height: 24),
        imagePadding: CGFloat = 24,
        imageForegroundColor: Color = .textWhiteColor,
        imageBackgroundColor: Color = .imageBackgroundColor,
        imageCornerRadius: CGFloat = 4,
        transactionHorizontalAlignment: HorizontalAlignment = .leading,
        transactionVerticalSpacing: CGFloat = 12,
        transactionTitleFont: MxFont = .mxBold,
        transactionTitleFontSize: CGFloat = 17,
        transactionTitleColor: Color = .textWhiteColor,
        transactionTypeFont: MxFont = .mxRegular,
        transactionTypeFontSize: CGFloat = 15,
        transactionTypeColor: Color = .textLightColor,
        transactionFrameAlignment: Alignment = .leading,
        detailsHorizontalAlignment: HorizontalAlignment = .trailing,
        detailsVerticalSpacing: CGFloat = 16,
        detailsTitleFont: MxFont = .mxBold,
        detailsTitleFontSize: CGFloat = 17,
        detailsDateFont: MxFont = .mxRegular,
        detailsDateFontSize: CGFloat = 13,
        detailsDateFontColor: Color = .textLightColor
    ) {
        self.mainHorizontalSpacing = mainHorizontalSpacing
        self.mainPadding = mainPadding
        self.mainBackgroundColor = mainBackgroundColor
        self.mainCornerRadius = mainCornerRadius
        self.imageSize = imageSize
        self.imagePadding = imagePadding
        self.imageForegroundColor = imageForegroundColor
        self.imageBackgroundColor = imageBackgroundColor
        self.imageCornerRadius = imageCornerRadius
        self.transactionHorizontalAlignment = transactionHorizontalAlignment
        self.transactionVerticalSpacing = transactionVerticalSpacing
        self.transactionTitleFont = transactionTitleFont
        self.transactionTitleFontSize = transactionTitleFontSize
        self.transactionTitleColor = transactionTitleColor
        self.transactionTypeFont = transactionTypeFont
        self.transactionTypeFontSize = transactionTypeFontSize
        self.transactionTypeColor = transactionTypeColor
        self.transactionFrameAlignment = transactionFrameAlignment
        self.detailsHorizontalAlignment = detailsHorizontalAlignment
        self.detailsVerticalSpacing = detailsVerticalSpacing
        self.detailsTitleFont = detailsTitleFont
        self.detailsTitleFontSize = detailsTitleFontSize
        self.detailsDateFont = detailsDateFont
        self.detailsDateFontSize = detailsDateFontSize
        self.detailsDateFontColor = detailsDateFontColor
    }
}
