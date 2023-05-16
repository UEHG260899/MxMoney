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
                Text(vm.texts.titleLabel)
                    .mxFont(.mxBold, size: 17)
            }
        }
    }

    var content: some View {
        ScrollView {
            VStack(spacing: 10) {
                MxTextField(
                    text: $vm.formData.firstName,
                    labelText: vm.texts.nameLabel
                )
                MxTextField(
                    text: $vm.formData.lastName,
                    labelText: vm.texts.lastNameLabel
                )
                MxTextField(
                    text: $vm.formData.email,
                    labelText: vm.texts.emailLabel,
                    scheme: .init(textfieldType: .emailAddress)
                )
                MxSecureTextField(
                    text: $vm.formData.password,
                    labelText: vm.texts.passwordLabel
                )
                MxSecureTextField(
                    text: $vm.formData.confirmPassword,
                    labelText: vm.texts.confirmPasswordLabel
                )
                Spacer(minLength: 20)
                MxLoadingButton(
                    labelText: vm.texts.signUpButton,
                    status: vm.viewStatus,
                    action: vm.attemptToCreateUser
                )
                    .disabled(vm.formData.isInvalid())
            }
        }
        .padding(.horizontal, 12)
        .alert(vm.texts.errorAlertTitle, isPresented: $vm.isErrorPresent) {
            Button("Accept", action: {})
        } message: {
            Text(vm.errorDescription)
        }

    }
}

struct SignUpView_Previews: PreviewProvider {
    static let viewModel = SignUpViewModel(
        authManager: AuthManager(),
        realmManager: RealmManager(),
        firebaseManager: FirebaseManager()
    )

    static var previews: some View {
        NavigationStack {
            SignUpView(vm: viewModel)
        }
        .previewDevice(.init(rawValue: "iPhone SE (3rd generation)"))

        NavigationStack {
            SignUpView(vm: viewModel)
        }
    }
}
