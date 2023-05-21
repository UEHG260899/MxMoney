//
//  NavigationContainerView.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 20/05/23.
//

import SwiftUI

struct NavigationContainerView: View {

    private let tabComponents: [TabComponent] = [
        .init(contentView: Text("Hola"), tabItem: Label("Home.Tab.Text", systemImage: "house")),
        .init(contentView: Text("Ajustes"), tabItem: Label("Settings.Tab.Text", systemImage: "gear"))
    ]

    var body: some View {
        TabView {
            ForEach(tabComponents) { component in
                component.contentView
                    .tabItem {
                        component.tabItem
                    }
            }
        }
    }
}

struct NavigationContainerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationContainerView()
    }
}
