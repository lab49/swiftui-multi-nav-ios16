//
//  AnimalSoundView.swift
//  NavSwiftUIiOS16
//
//  Created by Joseph McSorley on 3/31/24.
//

import SwiftUI

struct AnimalSoundView: View {
    @EnvironmentObject var navCoordinator: NavigationCoordinator<AppScreens>
    @Environment(\.dismiss) var dismiss
    @ObservedObject var vm: AnimalSoundViewModel
    
    var body: some View {
        VStack {
            Text("The \(vm.animal.type) says:")
                .font(.headline)
            Text(vm.animal.sound)
                .padding(.top, 16)
            Button(action: { vm.navCoordinator.popToRoot() }) {
                Text("Dismiss all")
            }
            .padding(.top, 48)
        }
    }
}

#Preview {
    let navCoordinator = NavigationCoordinator<AppScreens>()
    let animal = Animal(type: "Gerbil", numberOfLegs: 4, sound: "Squeaky Squeak")
    return AnimalSoundView(vm: AnimalSoundViewModel(animal: animal, navCoordinator: navCoordinator))
        .environmentObject(navCoordinator)
}
