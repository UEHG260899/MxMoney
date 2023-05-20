//
//  LoginFactory.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 25/03/23.
//

import Foundation

enum LoginFactory {
    static func make() -> LoginView {
        let authManager = AuthManager()
        let viewModel = LoginViewModel(authManager: authManager)
        let loginView = LoginView(vm: viewModel)
        return loginView
    }
}
