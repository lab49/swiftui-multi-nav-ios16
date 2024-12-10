//
//  AppScreens.swift
//  Veritask
//
//  Created by Joseph McSorley on 2/19/24.
//

import SwiftUI

indirect enum AppScreens: NavigationScreenDefinition {
    case animalMenu
    case animalDetail(Animal)
    case animalSound(Animal)
    
    static let root = AppScreens.animalMenu

    @ViewBuilder
    func screenView(navCoordinator: NavigationCoordinator<Self>) -> some View {
        switch self {
        case .animalMenu:
            mainListView(navCoordinator: navCoordinator)
        case .animalDetail(let animal):
            animalDetailView(animal: animal, navCoordinator: navCoordinator)
        case .animalSound(let animal):
            animalSoundView(animal: animal, navCoordinator: navCoordinator)
        }
    }
    
    private func mainListView(navCoordinator: NavigationCoordinator<Self>) -> some View {
        let vm = navCoordinator.observable(for: self, default: MainListViewModel(navCoordinator: navCoordinator))
        return MainListView(vm: vm)
    }
    
    private func animalDetailView(animal: Animal, navCoordinator: NavigationCoordinator<Self>) -> some View {
        let vm = navCoordinator.observable(for: self, default: AnimalDetailViewModel(animal: animal, navCoordinator: navCoordinator))
        return AnimalDetailView(vm: vm)
    }
    
    private func animalSoundView(animal: Animal, navCoordinator: NavigationCoordinator<Self>) -> some View {
        let vm = navCoordinator.observable(for: self, default: AnimalSoundViewModel(animal: animal, navCoordinator: navCoordinator))
        return AnimalSoundView(vm: vm)
    }
}
