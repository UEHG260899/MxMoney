//
//  HomeView.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 24/05/23.
//

import SwiftUI

struct HomeView<ViewModel: HomeViewModelProtocol>: View {

    @StateObject var vm: ViewModel

    var body: some View {
        NavigationStack {
            Group {
                switch vm.viewStatus {
                case .loading:
                    loadingView
                case .completed, .none:
                    contentView
                case .error:
                    EmptyView()
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Dashboard")
                        .mxFont(.mxBold, size: 17)
                }
            }
            .onAsyncLoad {
                await vm.fetchData()
            }
        }
    }

    var loadingView: some View {
        MxSpinner()
            .frame(width: 100, height: 100)
    }

    var contentView: some View {
        ZStack(alignment: .bottom) {

            Color.mainColor
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 34) {
                    HomeBalanceGrid()
                    HomeListView()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {

    static let devices = ["iPhone SE (3rd generation)", "iPhone 11", "iPhone 14 Pro Max"]

    class MockVm: HomeViewModelProtocol {
        var viewStatus: ViewStatus = .loading
        func fetchData() async {}
    }

    static let vm = MockVm()

    static var previews: some View {
        ForEach(devices, id: \.self) { device in
            HomeView(vm: MockVm())
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }
    }
}
