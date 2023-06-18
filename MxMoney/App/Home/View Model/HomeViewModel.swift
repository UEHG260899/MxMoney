//
//  HomeViewModel.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 24/05/23.
//

import SwiftUI

class HomeViewModel: HomeViewModelProtocol {

    @Published var viewStatus: ViewStatus = .loading
    @Published var transactions = [MoneyTransaction]()

    let firebaseManager: FirebaseManagerProtocol

    init(firebaseManager: FirebaseManagerProtocol) {
        self.firebaseManager = firebaseManager
    }

    @MainActor
    func fetchData() async {
        do {
            let userdId = UserDefaults.standard.string(forKey: "userId")
            transactions = try await firebaseManager.fetchRecent(fromCollection: .transactions,
                                                           whereQueryIsEqualTo: .init(fieldName: "userId", filterValue: userdId))
            viewStatus = .completed
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
}
