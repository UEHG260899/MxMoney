//
//  HomeView.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 24/05/23.
//

import SwiftUI

struct HomeView<ViewModel: HomeViewModelProtocol>: View {

    @State var vm: ViewModel

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct HomeView_Previews: PreviewProvider {

    class MockVm: HomeViewModelProtocol {}

    static var previews: some View {
        HomeView(vm: MockVm())
    }
}
