//
//  Text+FontExtensions.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 24/03/23.
//

import SwiftUI

extension Text {
    func mxFont(_ font: MxFont, size: CGFloat) -> Text {
        self
            .font(.custom(font.rawValue, size: size))
    }
}
