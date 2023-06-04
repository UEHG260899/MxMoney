//
//  MxSecureTextField.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 24/03/23.
//

import SwiftUI

struct MxSecureTextField: View {

    @State private var isSecureTextEntry = true
    @Binding var text: String
    let labelText: LocalizedStringKey
    var scheme: MxTextFieldScheme = .init()

    var iconImageName: String {
        isSecureTextEntry ? "eye.slash.fill" : "eye.fill"
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {

            Text(labelText)
                .mxFont(scheme.labelFont, size: scheme.labelFontSize)

            HStack {
                if isSecureTextEntry {
                    SecureField("", text: $text)
                        .font(.custom(scheme.textFieldFont.rawValue, size: scheme.textFieldFontSize))
                        .foregroundColor(scheme.textFieldForegroundColor)
                        .frame(height: scheme.textFieldHeight)
                        .padding(scheme.textFieldPadding)
                } else {
                    TextField("", text: $text)
                        .mxFont(scheme.textFieldFont, size: scheme.textFieldFontSize)
                        .foregroundColor(scheme.textFieldForegroundColor)
                        .frame(height: scheme.textFieldHeight)
                        .padding(scheme.textFieldPadding)
                }

                Image(systemName: iconImageName)
                    .resizable()
                    .frame(width: 15, height: 15)
                    .padding(.trailing, 10)
                    .onTapGesture {
                        isSecureTextEntry.toggle()
                    }
            }
            .background {
                RoundedRectangle(cornerRadius: scheme.cornerRadius)
                    .foregroundColor(scheme.rectangleForegroundColor)
            }
        }
    }
}

struct MxSecureTextField_Previews: PreviewProvider {
    static var previews: some View {
        MxSecureTextField(text: .constant("Hola"), labelText: "Login.Password.Text")
    }
}
