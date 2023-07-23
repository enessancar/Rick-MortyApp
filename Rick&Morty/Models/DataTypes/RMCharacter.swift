//
//  RMCharacter.swift
//  Rick&Morty
//
//  Created by Enes Sancar on 21.07.2023.
//

import Foundation

struct RMCharacter: Decodable {
    let id: Int
    let name: String
    let status: RMCharacterStatus
    let species: String
    let type: String
    let gender: RMCharacterGender
    let origin: RMOrigin
    let location: RMSingleLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

struct RMOrigin: Decodable {
    let name: String
    let url: String
}

struct RMSingleLocation: Decodable {
    let name: String
    let url: String
}

enum RMCharacterGender: String, Decodable {
    case male = "Male"
    case female = "Female"
    case genderless = "Genderless"
    case unknown = "unknown"
}

enum RMCharacterStatus: String, Decodable {
    case alive  = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

