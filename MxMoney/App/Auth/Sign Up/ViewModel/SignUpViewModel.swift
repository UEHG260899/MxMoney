//
//  SignUpViewModel.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 28/03/23.
//

import Foundation

class SignUpViewModel: ObservableObject {
    @Published var formData: SignUpFormData = .init()
    @Published var viewStatus: ViewStatus = .none {
        didSet {
            isErrorPresent = viewStatus == .error
        }
    }
    @Published var isErrorPresent = false

    let authManager: AuthManagerProtocol
    let texts = SignUpTexts()
    var errorDescription = ""

    init(authManager: AuthManagerProtocol) {
        self.authManager = authManager
    }

    func attemptToCreateUser() {
        viewStatus = .loading
        authManager.register(email: formData.email, password: formData.password) { [weak self] result in
            guard let self else { return }

            if case .failure(let error) = result {
                if case .authentication(let description) = error {
                    self.errorDescription = description
                    self.viewStatus = .error
                }
            }
        }
    }
}
