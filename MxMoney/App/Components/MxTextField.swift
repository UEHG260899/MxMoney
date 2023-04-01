//
//  MxTextField.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 24/03/23.
//

import SwiftUI

struct MxTextFieldScheme {
    var alignment: HorizontalAlignment = .leading
    var verticalSpacing = 10.0
    var labelFont: MxFont = .mxRegular
    var labelFontSize = 17.0
    var textfieldType: UIKeyboardType = .default
    var textFieldFont: MxFont = .mxRegular
    var textFieldFontSize = 15.0
    var textFieldForegroundColor: Color = .white
    var textFieldHeight = 40.0
    var textFieldPadding = 5.0
    var cornerRadius = 4.0
    var rectangleForegroundColor: Color = .cardBackgroundColor
}

struct MxTextField: View {

    @Binding var text: String
    let labelText: LocalizedStringKey
    var scheme: MxTextFieldScheme = .init()

    var body: some View {
        VStack(alignment: scheme.alignment, spacing: scheme.verticalSpacing) {

            Text(labelText)
                .mxFont(scheme.labelFont, size: scheme.labelFontSize)

            TextField("", text: $text)
                .mxFont(scheme.textFieldFont, size: scheme.textFieldFontSize)
                .keyboardType(scheme.textfieldType)
                .foregroundColor(scheme.textFieldForegroundColor)
                .frame(height: scheme.textFieldHeight)
                .padding(scheme.textFieldPadding)
                .background {
                    RoundedRectangle(cornerRadius: scheme.cornerRadius)
                        .foregroundColor(scheme.rectangleForegroundColor)
                }
        }
    }
}

struct MxTextField_Previews: PreviewProvider {
    static var previews: some View {
        MxTextField(text: .constant(""), labelText: "Login.Email.Text")
    }
}
