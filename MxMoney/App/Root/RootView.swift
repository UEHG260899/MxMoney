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
        if vm.currentUser != nil {
            NavigationContainerView()
        } else {
            LoginFactory.make()
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
