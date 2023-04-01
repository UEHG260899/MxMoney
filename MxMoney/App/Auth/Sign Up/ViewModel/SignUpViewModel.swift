//
//  SignUpViewModel.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 28/03/23.
//

import Foundation

class SignUpViewModel: ObservableObject {
    @Published var formData: SignUpFormData = .init()
    @Published var viewStatus: ViewStatus = .none
    let texts = SignUpTexts()
}
