//
//  PokemonModel.swift
//  PokemonAPI
//
//  Created by atakan yetkin on 22.03.2023.
//

import Foundation

// MARK: - PokemonModel
struct PokemonModel: Codable {
    let count: Int?
    let next, previous: String?
    let results: [Pokemon]?
}

// MARK: - Pokemon
struct Pokemon: Codable {
    let name: String?
    let url: String?
}


// MARK: - Photo
struct Photo: Codable {
 
    let sprites: Sprites?
 
    enum CodingKeys: String, CodingKey {
        case sprites
    }
}

 
 
// MARK: - Sprites
class Sprites: Codable {
    let backDefault, backFemale, backShiny, backShinyFemale: String?
    let frontDefault, frontFemale, frontShiny, frontShinyFemale: String?
    let animated: Sprites?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backFemale = "back_female"
        case backShiny = "back_shiny"
        case backShinyFemale = "back_shiny_female"
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
        case animated
    }

    init(backDefault: String?, backFemale: String?, backShiny: String?, backShinyFemale: String?, frontDefault: String?, frontFemale: String?, frontShiny: String?, frontShinyFemale: String?, animated: Sprites?) {
        self.backDefault = backDefault
        self.backFemale = backFemale
        self.backShiny = backShiny
        self.backShinyFemale = backShinyFemale
        self.frontDefault = frontDefault
        self.frontFemale = frontFemale
        self.frontShiny = frontShiny
        self.frontShinyFemale = frontShinyFemale
        self.animated = animated
    }
}
 

  

 

 
 

 
