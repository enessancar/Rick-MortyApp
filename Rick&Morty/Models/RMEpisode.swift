//
//  RMEpisode.swift
//  Rick&Morty
//
//  Created by Enes Sancar on 21.07.2023.
//

import Foundation

struct RMEpisode: Decodable {
    let id: Int
    let name: String
    let airDate: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name, episode, url, created ; 
        case characters
        case airDate = "air_date"
    }
}

