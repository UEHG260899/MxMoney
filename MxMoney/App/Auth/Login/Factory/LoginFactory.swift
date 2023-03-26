//
//  LoginFactory.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 25/03/23.
//

import Foundation

enum LoginFactory {
    static func make() -> LoginView {
        let viewModel = LoginViewModel()
        let loginView = LoginView(vm: viewModel)
        return loginView
    }
}
