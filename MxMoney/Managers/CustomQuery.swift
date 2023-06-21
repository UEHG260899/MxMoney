//
//  CustomQuery.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 04/06/23.
//

import Foundation

struct CustomQuery {
    let limit: Int? = nil
    let fieldName: String
    let filterValue: Any
}

struct BetweenQuery {
    let filterFieldName: String
    let filterValue: Any
    let fieldName: String
    let lowerLimit: Any
    let upperLimit: Any
}

