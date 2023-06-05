//
//  AsyncViewDidLoadModifier.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 04/06/23.
//

import SwiftUI

struct AsyncViewDidLoadModifier: ViewModifier {

    @State private var didLoad = false
    private let action: (() async -> Void)?

    init(action: (() async -> Void)? = nil) {
        self.action = action
    }

    func body(content: Content) -> some View {
        content.task {
            if didLoad == false {
                didLoad = true
                await action?()
            }
        }
    }
}
