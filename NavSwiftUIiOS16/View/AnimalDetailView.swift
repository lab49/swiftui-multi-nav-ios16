//
//  AnimalDetailView.swift
//  NavSwiftUIiOS16
//
//  Created by Joseph McSorley on 3/30/24.
//

import SwiftUI

struct AnimalDetailView: View {
    @EnvironmentObject var navCoordinator: NavigationCoordinator<AppScreens>
    @Environment(\.dismiss) var dismiss
    @ObservedObject var vm: AnimalDetailViewModel
    
    var body: some View {
        VStack {
            Text("The \(vm.animal.type) has \(vm.animal.numberOfLegs) legs")
                .font(.headline)
            NavigationLink(value: AppScreens.animalSound(vm.animal)) {
                Text("Hear its sound")
            }
            .padding(.top, 16)
            Button(action: { dismiss() }) {
                Text("Dismiss")
            }
            .padding(.top, 48)
        }
    }
}

#Preview {
    let navCoordinator = NavigationCoordinator<AppScreens>()
    let animal = Animal(type: "Gerbil", numberOfLegs: 4, sound: "Squeaky Squeak")
    return AnimalDetailView(vm: AnimalDetailViewModel(animal: animal, navCoordinator: navCoordinator))
        .environmentObject(navCoordinator)
}
