//
//  AnimalSoundViewModel.swift
//  NavSwiftUIiOS16
//
//  Created by Joseph McSorley on 3/31/24.
//

import Combine

class AnimalSoundViewModel: ObservableObject {
    let animal: Animal
    let navCoordinator: NavigationCoordinator<AppScreens>
    
    init(animal: Animal, navCoordinator: NavigationCoordinator<AppScreens>) {
        self.animal = animal
        self.navCoordinator = navCoordinator
        print("AnimalSoundViewModel.init()  Called")
    }
    
    deinit {
        print("AnimalSoundViewModel.deinit()  Called")
    }
}
