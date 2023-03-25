//
//  TextField+FontExtensions.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 24/03/23.
//

import SwiftUI

extension TextField {
    func mxFont(_ font: MxFont, size: CGFloat) -> some View {
        self
            .font(.custom(font.rawValue, size: size))
    }
}
