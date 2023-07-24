//
//  RMCharacterDetailViewViewModel.swift
//  Rick&Morty
//
//  Created by Enes Sancar on 23.07.2023.
//

import Foundation

final class RMCharacterDetailViewViewModel {
    private let character: RMCharacter
    
    init(character: RMCharacter) {
        self.character = character
    }
    
    public var title: String {
        character.name.uppercased()
    }
}
