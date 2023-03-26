//
//  MxButton.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 25/03/23.
//

import SwiftUI

struct MxButtonScheme {
    var fontName: MxFont = .mxRegular
    var fontSize = 17.0
    var fontForegroundColor: Color = .white
    var height = 40.0
    var padding = 5.0
    var cornerRadius = 4.0
    var foregroundColor: Color = .imageBackgroundColor
}

struct MxButton: View {

    let labelText: String
    var scheme: MxButtonScheme = .init()
    let action: (() -> Void)

    var body: some View {
        Button(action: action) {
            Text(labelText)
                .mxFont(scheme.fontName, size: scheme.fontSize)
                .foregroundColor(scheme.fontForegroundColor)
                .padding()
                .frame(height: scheme.height)
                .frame(maxWidth: .infinity)
                .padding(scheme.padding)
                .background {
                    RoundedRectangle(cornerRadius: scheme.cornerRadius)
                        .foregroundColor(scheme.foregroundColor)
                }
        }
    }
}

struct MxButton_Previews: PreviewProvider {
    static var previews: some View {
        MxButton(labelText: "Some Text", action: {})
    }
}
