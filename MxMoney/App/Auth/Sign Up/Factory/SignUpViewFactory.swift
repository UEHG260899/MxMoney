//
//  SignUpFactory.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 28/03/23.
//

import Foundation

enum SignUpViewFactory {
    static func make() -> SignUpView {
        let authManager = AuthManager()
        let realManager = RealmManager()
        let viewModel = SignUpViewModel(authManager: authManager, realmManager: realManager)
        return SignUpView(vm: viewModel)
    }
}
