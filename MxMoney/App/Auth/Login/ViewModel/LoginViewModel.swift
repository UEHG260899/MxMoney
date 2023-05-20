//
//  LoginViewModel.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 25/03/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var formData: LoginFormData = .init()
    @Published var viewStatus: ViewStatus = .none {
        didSet {
            isErrorPresent = viewStatus == .error
        }
    }
    @Published var isErrorPresent = false

    let authManager: AuthManagerProtocol
    let texts = LoginTexts()
    var errorDescription = ""

    init(authManager: AuthManagerProtocol) {
        self.authManager = authManager
    }

    func attemptToLogin() async {
        await MainActor.run {
            viewStatus = .loading
        }

        do {
            try await authManager.login(email: formData.email, password: formData.password)
        } catch {
            await handleError(error)
        }
    }

    private func handleError(_ error: Error) async {
        await MainActor.run {
            viewStatus = .error

            if let appError = error as? AppError {
                if case .authentication(let description) = appError {
                    self.errorDescription = description
                }
            }
        }
    }
}
