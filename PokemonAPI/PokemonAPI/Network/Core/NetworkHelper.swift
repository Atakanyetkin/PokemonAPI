//
//  NetworkHelper.swift
//  PokemonAPI
//
//  Created by atakan yetkin on 22.03.2023.
//


import Foundation

enum HTTPEndPoint: String {

    case Pokemons = "pokemon?offset=10&limit=30"
}

enum CoreHTTP: String {
    
    case CORE = "https://pokeapi.co/api/v2/"
}

final class NetworkHelper {
    static let shared = NetworkHelper()
    
    public func pokemonURL() -> String {
        return "\(CoreHTTP.CORE.rawValue)\(HTTPEndPoint.Pokemons.rawValue)"
    }
}


 

 
