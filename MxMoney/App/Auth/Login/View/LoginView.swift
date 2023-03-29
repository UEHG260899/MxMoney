//
//  LoginView.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 24/03/23.
//

import SwiftUI

struct LoginView: View {

    @StateObject var vm: LoginViewModel

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

            MxTextField(
                text: $vm.email,
                labelText: "Email",
                scheme: .init(textfieldType: .emailAddress)
            )

            MxSecureTextField(text: $vm.password, labelText: "Contraseña")

            Spacer()

            MxLoadingButton(labelText: "Iniciar Sesión", status: vm.viewStatus, action: {})

            NavigationLink {
                SignUpViewFactory.make()
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
        LoginView(vm: .init())
            .previewDevice(.init(rawValue: "iPhone SE (3rd generation)"))

        LoginView(vm: .init())

    }
}
