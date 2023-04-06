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
            Text(vm.texts.headerLabel)
                .mxFont(.mxBold, size: 34)

            MxTextField(
                text: $vm.email,
                labelText: vm.texts.emailLabel,
                scheme: .init(textfieldType: .emailAddress)
            )

            MxSecureTextField(text: $vm.password, labelText: vm.texts.passwordLabel)

            Spacer()

            MxLoadingButton(labelText: vm.texts.loginButton, status: vm.viewStatus, action: {})

            NavigationLink {
                SignUpViewFactory.make()
            } label: {
                Text(vm.texts.signUpButton)
                    .mxFont(.mxRegular, size: 14)
                    .foregroundColor(.white)
            }

            Spacer()

        }
        .padding(.horizontal, 12)
        .alert(vm.texts.errorAlertTitle, isPresented: $vm.isErrorPresent) {
            Button("Accept", action: {})
        } message: {
            Text("Test")
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(vm: .init())
            .previewDevice(.init(rawValue: "iPhone SE (3rd generation)"))

        LoginView(vm: .init())

    }
}
