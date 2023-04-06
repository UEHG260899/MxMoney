//
//  LoginViewModel.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 25/03/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var viewStatus: ViewStatus = .none {
        didSet {
            isErrorPresent = viewStatus == .error
        }
    }
    @Published var isErrorPresent = false
    let texts = LoginTexts()
}
