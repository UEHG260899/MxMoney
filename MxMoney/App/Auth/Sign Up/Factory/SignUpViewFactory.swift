//
//  SignUpFactory.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 28/03/23.
//

import Foundation

enum SignUpViewFactory {
    static func make() -> SignUpView {
        let viewModel = SignUpViewModel()
        return SignUpView(vm: viewModel)
    }
}
