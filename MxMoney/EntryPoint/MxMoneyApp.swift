//
//  MxMoneyApp.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 23/03/23.
//

import SwiftUI

@main
struct MxMoneyApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
