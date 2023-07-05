//
//  SignUpViewModel.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 28/03/23.
//
// swiftlint:disable force_cast

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

    func attemptToCreateUser() async {
        await MainActor.run {
            viewStatus = .loading
        }

        do {
            let userId = try await authManager.register(email: formData.email, password: formData.password)
            try await storeUser(id: userId)
        } catch {
            await handleError(error as! AppError)
        }
    }

    private func storeUser(id: String) async throws {
        let user = User(
            id: id,
            firstName: formData.firstName,
            lastName: formData.lastName,
            email: formData.email
        )

        try await firebaseManager.store(user, in: "users", with: user.id)
        await MainActor.run {
            self.realmManager.save(user)
        }
    }

    private func handleError(_ error: AppError) async {
        await MainActor.run {
            viewStatus = .error

            switch error {
            case .authentication(let description):
                errorDescription = description
            default:
                debugPrint("")
            }
        }
    }
}
