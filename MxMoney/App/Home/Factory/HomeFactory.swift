//
//  HomeFactory.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 24/05/23.
//

import SwiftUI

enum HomeFactory {
    static func make() -> some View {
        let firebaseManager = FirebaseManager()
        let viewModel = HomeViewModel(firebaseManager: firebaseManager)
        let view = HomeView(vm: viewModel)
        return view
    }
}
