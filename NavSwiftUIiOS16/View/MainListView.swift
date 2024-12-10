//
//  MainListView.swift
//  NavSwiftUIiOS16
//
//  Created by Joseph McSorley on 3/30/24.
//

import SwiftUI

struct MainListView: View {
    @EnvironmentObject var navCoordinator: NavigationCoordinator<AppScreens>
    @ObservedObject var vm: MainListViewModel
    
    var body: some View {
        VStack {
            Text("Types of Animals")
                .font(.headline)
            List {
                ForEach(vm.animals) { animal in
                    Button(action: { vm.navCoordinator.push(.animalDetail(animal)) }) {
                        Text(animal.type)
                    }
                }
            }
            Spacer()
        }
    }
}

#Preview {
    let navCoordinator = NavigationCoordinator<AppScreens>()
    return MainListView(vm: MainListViewModel(navCoordinator: navCoordinator))
        .environmentObject(navCoordinator)
}
