//
//  View+Extensions.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 04/06/23.
//

import SwiftUI

extension View {
    func onAsyncLoad(perform action: (() async -> Void)? = nil) -> some View {
        modifier(AsyncViewDidLoadModifier(action: action))
    }
}
