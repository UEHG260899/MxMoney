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
                text: $vm.formData.email,
                labelText: vm.texts.emailLabel,
                scheme: .init(textfieldType: .emailAddress)
            )

            MxSecureTextField(text: $vm.formData.password, labelText: vm.texts.passwordLabel)

            Spacer()

            MxLoadingButton(
                labelText: vm.texts.loginButton,
                status: vm.viewStatus,
                isDisabled: vm.formData.fieldsAreEmpty()) {
                Task {
                    await vm.attemptToLogin()
                }
            }

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
            Text(vm.errorDescription)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {

        let viewModel = LoginViewModel(authManager: AuthManager())

        LoginView(vm: viewModel)
            .previewDevice(.init(rawValue: "iPhone SE (3rd generation)"))

        LoginView(vm: viewModel)

    }
}
