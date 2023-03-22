//
//  DetailModels.swift
//  PokemonAPI
//
//  Created by atakan yetkin on 22.03.2023.
//

import Foundation

// MARK: - DetailModel
struct DetailModel: Codable {
    let abilities: [Ability]?
    
    enum CodingKeys: String, CodingKey {
        case abilities
     
    }
}

// MARK: - Ability
struct Ability: Codable {
    let ability: Species?
    let isHidden: Bool?
    let slot: Int?

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
}

// MARK: - Species
struct Species: Codable {
    let name: String?
    let url: String?
    
}


