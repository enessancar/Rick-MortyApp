//
//  RMgetAllCharacterResponse.swift
//  Rick&Morty
//
//  Created by Enes Sancar on 22.07.2023.
//

import Foundation

struct RMGetAllCharactersResponse: Decodable {
    
    let info: Info
    let results: [RMCharacter]
    
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
}





