//
//  AppDelegate.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 06/05/23.
//

import Foundation
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
