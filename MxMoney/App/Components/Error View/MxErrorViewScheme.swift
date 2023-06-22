//
//  MxErrorViewScheme.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 21/06/23.
//

import SwiftUI

struct MxErrorViewScheme {
    // MARK: - Container
    var containerVerticalSpacing: CGFloat
    var containerHorizontalPadding: CGFloat

    // MARK: - Image
    var imageSize: CGSize
    var imageForegroundColor: Color

    // MARK: - Texts
    var textsVerticalSpacing: CGFloat
    var titleFont: MxFont
    var titleFontSize: CGFloat
    var titleFontColor: Color
    var subtitleFont: MxFont
    var subtitleFontSize: CGFloat
    var subtitleFontColor: Color
    var subtitleMultilineAlignment: TextAlignment

    init(
        containerVerticalSpacing: CGFloat = 30,
        containerHorizontalPadding: CGFloat = 12,
        imageSize: CGSize = .init(width: 100, height: 100),
        imageForegroundColor: Color = .expenseColor,
        textsVerticalSpacing: CGFloat = 10,
        titleFont: MxFont = .mxBlack,
        titleFontSize: CGFloat = 34,
        titleFontColor: Color = .textWhiteColor,
        subtitleFont: MxFont = .mxBold,
        subtitleFontSize: CGFloat = 17,
        subtitleFontColor: Color = .textWhiteColor,
        subtitleMultilineAlignment: TextAlignment = .center
    ) {
        self.containerVerticalSpacing = containerVerticalSpacing
        self.containerHorizontalPadding = containerHorizontalPadding
        self.imageSize = imageSize
        self.imageForegroundColor = imageForegroundColor
        self.textsVerticalSpacing = textsVerticalSpacing
        self.titleFont = titleFont
        self.titleFontSize = titleFontSize
        self.titleFontColor = titleFontColor
        self.subtitleFont = subtitleFont
        self.subtitleFontSize = subtitleFontSize
        self.subtitleFontColor = subtitleFontColor
        self.subtitleMultilineAlignment = subtitleMultilineAlignment
    }
}
