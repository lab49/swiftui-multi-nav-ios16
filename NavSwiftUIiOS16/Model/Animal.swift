//
//  Animal.swift
//  NavSwiftUIiOS16
//
//  Created by Joseph McSorley on 3/30/24.
//

import Foundation

struct Animal: Codable, Identifiable, Hashable {
    let type: String
    let numberOfLegs: Int
    let sound: String
    
    var id: String { type }
}
