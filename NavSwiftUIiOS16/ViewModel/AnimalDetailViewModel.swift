//
//  AnimalDetailViewModel.swift
//  NavSwiftUIiOS16
//
//  Created by Joseph McSorley on 3/30/24.
//

import Combine

class AnimalDetailViewModel: ObservableObject {
    let animal: Animal
    let navCoordinator: NavigationCoordinator<AppScreens>
    
    init(animal: Animal, navCoordinator: NavigationCoordinator<AppScreens>) {
        self.animal = animal
        self.navCoordinator = navCoordinator
        print("AnimalDetailViewModel.init()  Called")
    }
    
    deinit {
        print("AnimalDetailViewModel.deinit()  Called")
    }
}
