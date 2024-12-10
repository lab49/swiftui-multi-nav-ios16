//
//  MainListViewModel.swift
//  NavSwiftUIiOS16
//
//  Created by Joseph McSorley on 3/30/24.
//

import Combine

class MainListViewModel: ObservableObject {
    let navCoordinator: NavigationCoordinator<AppScreens>
    
    init(navCoordinator: NavigationCoordinator<AppScreens>) {
        self.navCoordinator = navCoordinator
    }
    
    @Published var animals: [Animal] = [
        Animal(type: "Dog", numberOfLegs: 4, sound: "Woof"),
        Animal(type: "Cat", numberOfLegs: 4, sound: "Meow"),
        Animal(type: "Bird", numberOfLegs: 2, sound: "Tweet"),
        Animal(type: "Whale", numberOfLegs: 0, sound: "Orf Orf"),
        Animal(type: "Snake", numberOfLegs: 0, sound: "Ssssss")
    ]
}
