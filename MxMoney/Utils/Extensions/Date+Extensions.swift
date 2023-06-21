//
//  Date+Extensions.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 20/06/23.
//

import Foundation

extension Date {

    static var firstDateOfMonth: Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Date()))!
    }

    static var lastDateOfMonth: Date {
        return Calendar.current.date(byAdding: .init(month: 1, day: -1), to: firstDateOfMonth)!
    }

}
