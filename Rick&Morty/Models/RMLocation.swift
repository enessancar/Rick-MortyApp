//
//  RMLocation.swift
//  Rick&Morty
//
//  Created by Enes Sancar on 21.07.2023.
//

import Foundation

struct RMLocation: Decodable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}
