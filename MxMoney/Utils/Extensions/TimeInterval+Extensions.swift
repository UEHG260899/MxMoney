//
//  TimeInterval+Extensions.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 17/06/23.
//

import Foundation

extension TimeInterval {
    func toDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyyMMdd", options: 0, locale: .current)
        let date = Date(timeIntervalSince1970: self)
        return dateFormatter.string(from: date)
    }
}
