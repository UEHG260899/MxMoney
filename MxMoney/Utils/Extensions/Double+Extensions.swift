//
//  Double+Extensions.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 19/06/23.
//

import Foundation

extension Double {
    func toCurrencyString() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = .current
        return numberFormatter.string(from: self as NSNumber) ?? ""
    }
}
