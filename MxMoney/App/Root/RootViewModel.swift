//
//  RootViewModel.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 20/05/23.
//

import Foundation
import FirebaseAuth

class RootViewModel: ObservableObject {
    @Published var currentUser: FirebaseAuth.User?

    init() {
        Auth.auth().addStateDidChangeListener { auth, user in
            self.currentUser = user
            UserDefaults.standard.set(user?.uid, forKey: "userId")
        }
    }
}
