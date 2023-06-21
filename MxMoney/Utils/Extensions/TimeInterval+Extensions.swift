//
//  TimeInterval+Extensions.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 17/06/23.
//

import Foundation

extension TimeInterval {

    static func fromStartAndEndOfMonth() -> (startOfMonth: TimeInterval, endOfMonth: TimeInterval) {
        let firstDayTimeInterval = Date.firstDateOfMonth.timeIntervalSince1970
        let lastDayTimeInterval = Date.lastDateOfMonth.timeIntervalSince1970
        return (firstDayTimeInterval, lastDayTimeInterval)
    }

    /// Converts a given TimeInterval to a localized String portraying the Date it corresponds to
    /// - Returns: Date String
    func toDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyyMMdd", options: 0, locale: .current)
        let date = Date(timeIntervalSince1970: self)
        return dateFormatter.string(from: date)
    }
}
