//
//  RMgetAllCharacterResponse.swift
//  Rick&Morty
//
//  Created by Enes Sancar on 22.07.2023.
//

import Foundation

struct RMGetAllCharactersResponse: Decodable {
    
    struct Info: Decodable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    
    let info: Info
    let results: [RMCharacter]
}



