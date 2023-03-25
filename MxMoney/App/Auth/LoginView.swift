//
//  LoginView.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 24/03/23.
//

import SwiftUI

struct LoginView: View {

    @State private var email = ""
    @State private var password = ""

    var body: some View {
        NavigationStack {
            ZStack {

                Color.mainColor
                    .ignoresSafeArea()

                content
            }
        }
    }

    var content: some View {
        VStack(spacing: 25) {
            Spacer()
            Text("MxMoney")
                .mxFont(.mxBold, size: 34)

            MxTextField(text: $email, labelText: "Email")

            MxSecureTextField(text: $password, labelText: "Contraseña")

            Spacer()
            Button(action: {}, label: {
                Text("Login")
                    .mxFont(.mxRegular, size: 17)
                    .foregroundColor(.white)
                    .padding()
                    .frame(height: 40)
                    .frame(maxWidth: .infinity)
                    .padding(5)
                    .background {
                        RoundedRectangle(cornerRadius: 4)
                            .foregroundColor(.gray)
                    }
            })

            NavigationLink {
                // TODO: Change for signup view
                Text("Hola")
            } label: {
                Text("Registrarse")
                    .mxFont(.mxRegular, size: 14)
                    .foregroundColor(.white)
            }

            Spacer()

        }
        .padding(.horizontal, 12)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .previewDevice(.init(rawValue: "iPhone SE (3rd generation)"))

        LoginView()

    }
}
