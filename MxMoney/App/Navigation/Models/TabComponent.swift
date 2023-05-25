//
//  TabComponent.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 20/05/23.
//

import SwiftUI

struct TabComponent: Identifiable {
    let id = UUID().uuidString
    let contentView: AnyView
    let tabItem: AnyView

    init(contentView: some View, tabItem: some View) {
        self.contentView = AnyView(contentView)
        self.tabItem = AnyView(tabItem)
    }
}
