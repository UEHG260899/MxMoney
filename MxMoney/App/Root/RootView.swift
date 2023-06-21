//
//  RootView.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 24/03/23.
//

import SwiftUI

struct RootView: View {

    @StateObject private var vm = RootViewModel()

    var body: some View {
        Group {
            if vm.currentUser != nil {
                NavigationContainerView()
            } else {
                LoginFactory.make()
            }
        }
        .animation(.easeOut(duration: 0.5), value: vm.currentUser)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
