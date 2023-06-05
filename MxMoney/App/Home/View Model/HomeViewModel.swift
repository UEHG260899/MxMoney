//
//  HomeViewModel.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 24/05/23.
//

import SwiftUI

class HomeViewModel: HomeViewModelProtocol {

    @Published var viewStatus: ViewStatus = .loading
    let firebaseManager: FirebaseManagerProtocol

    init(firebaseManager: FirebaseManagerProtocol) {
        self.firebaseManager = firebaseManager
    }

    func fetchData() async {
    }
}
