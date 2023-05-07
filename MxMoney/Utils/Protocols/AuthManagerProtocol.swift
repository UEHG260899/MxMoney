//
//  AuthManagerProtocol.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 06/05/23.
//

import Foundation

protocol AuthManagerProtocol {
    func register(email: String, password: String, completion: @escaping (Result<Void, AppError>) -> Void)
}
