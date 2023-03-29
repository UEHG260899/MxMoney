//
//  MxLoadingButton.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 29/03/23.
//

import SwiftUI

struct MxLoadingButtonScheme {
    var fontName: MxFont = .mxRegular
    var fontSize = 17.0
    var fontForegroundColor: Color = .white
    var height = 40.0
    var padding = 5.0
    var cornerRadius = 4.0
    var foregroundColor: Color = .imageBackgroundColor
    var spinnerSize: CGSize = .init(width: 50, height: 50)
}

struct MxLoadingButton: View {

    let labelText: String
    let status: ViewStatus
    var scheme: MxLoadingButtonScheme = .init()
    let action: (() -> Void)

    var body: some View {
        Button(action: self.action) {
            HStack(spacing: 0) {
                if status == .loading {
                    MxSpinner()
                        .frame(width: scheme.spinnerSize.width, height: scheme.spinnerSize.height)
                }

                textComponent
            }
            .frame(maxWidth: .infinity)
            .background {
                RoundedRectangle(cornerRadius: scheme.cornerRadius)
                    .foregroundColor(scheme.foregroundColor.opacity(backgroundOpacity))
            }
        }
        .disabled(status == .loading)
    }

    var textComponent: some View {
        Text(labelText)
            .mxFont(scheme.fontName, size: scheme.fontSize)
            .foregroundColor(scheme.fontForegroundColor)
            .padding(.vertical)
            .frame(height: scheme.height)
            .padding(scheme.padding)
    }

    var backgroundOpacity: CGFloat {
        status == .loading ? 0.5 : 1
    }
}

struct MxLoadingButton_Previews: PreviewProvider {
    static var previews: some View {
        MxLoadingButton(labelText: "Iniciar Sesión", status: .loading, action: {})
    }
}
