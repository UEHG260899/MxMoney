//
//  SignUpViewModel.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 28/03/23.
//

import Foundation
import RealmSwift

class SignUpViewModel: ObservableObject {
    @Published var formData: SignUpFormData = .init()
    @Published var viewStatus: ViewStatus = .none {
        didSet {
            isErrorPresent = viewStatus == .error
        }
    }
    @Published var isErrorPresent = false

    let authManager: AuthManagerProtocol
    let realmManager: RealmManagerProtocol
    let firebaseManager: FirebaseManagerProtocol
    let texts = SignUpTexts()
    var errorDescription = ""

    init(
        authManager: AuthManagerProtocol,
        realmManager: RealmManagerProtocol,
        firebaseManager: FirebaseManagerProtocol
    ) {
        self.authManager = authManager
        self.realmManager = realmManager
        self.firebaseManager = firebaseManager
    }

    func attemptToCreateUser() {
        viewStatus = .loading
        authManager.register(email: formData.email, password: formData.password) { [weak self] result in
            guard let self else { return }

            switch result {
            case .success(let userId):
                self.viewStatus = .completed
                self.storeUser(id: userId)
            case .failure(let error):
                if case .authentication(let description) = error {
                    self.errorDescription = description
                    self.viewStatus = .error
                }
            }
        }
    }

    private func storeUser(id: String) {
        let user = User(
            id: id,
            firstName: formData.firstName,
            lastName: formData.lastName,
            email: formData.email
        )

        Task {
            do {
                try await firebaseManager.store(user)
            } catch {
                self.errorDescription = "F"
                self.viewStatus = .error
            }
        }

        realmManager.save(user)
    }
}
