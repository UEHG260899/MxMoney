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
        NavigationStack {
            ZStack {

                Color.mainColor
                    .ignoresSafeArea()

                ScrollView {
                    HomeBalanceGrid()
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Dashboard")
                        .mxFont(.mxBold, size: 17)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {

    static let devices = ["iPhone SE (3rd generation)", "iPhone 11", "iPhone 14 Pro Max"]

    class MockVm: HomeViewModelProtocol {}

    static var previews: some View {
        ForEach(devices, id: \.self) { device in
            HomeView(vm: MockVm())
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }
    }
}
