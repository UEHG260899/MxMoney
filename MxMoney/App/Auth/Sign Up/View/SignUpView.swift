//
//  SignUpView.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 28/03/23.
//

import SwiftUI

struct SignUpView: View {

    @StateObject var vm: SignUpViewModel

    var body: some View {
        ZStack {
            Color.mainColor
                .ignoresSafeArea()

            content
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                MxBackButton()
            }
            ToolbarItem(placement: .principal) {
                Text("Registrarse")
                    .mxFont(.mxBold, size: 17)
            }
        }
    }

    var content: some View {
        ScrollView {
            VStack(spacing: 10) {
                MxTextField(
                    text: $vm.formData.firstName,
                    labelText: "Nombre"
                )
                MxTextField(
                    text: $vm.formData.lastName,
                    labelText: "Apellido"
                )
                MxTextField(
                    text: $vm.formData.email,
                    labelText: "Email",
                    scheme: .init(textfieldType: .emailAddress)
                )
                MxSecureTextField(
                    text: $vm.formData.password,
                    labelText: "Contraseña"
                )
                MxSecureTextField(
                    text: $vm.formData.confirmPassword,
                    labelText: "Confirmar contraseña"
                )
                Spacer(minLength: 20)
                MxLoadingButton(labelText: "Registrarse", status: vm.viewStatus, action: {})
            }
        }
        .padding(.horizontal, 12)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SignUpView(vm: .init())
        }
        .previewDevice(.init(rawValue: "iPhone SE (3rd generation)"))

        NavigationStack {
            SignUpView(vm: .init())
        }
    }
}
