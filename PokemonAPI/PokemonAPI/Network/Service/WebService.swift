//
//  WebServices.swift
//  PokemonAPI
//
//  Created by atakan yetkin on 22.03.2023.
//

import Alamofire

protocol ServiceProtocol {
    
    
    func getPokemons(onSuccess: @escaping (PokemonModel?) -> (), onError: @escaping (AFError) -> ())
    func getPhotos(url: String, onSuccess: @escaping (Photo?) -> (), onError: @escaping (AFError) -> ())
    func getAbilities(url: String, onSuccess: @escaping (DetailModel?) -> (), onError: @escaping (AFError) -> ())
    
    
    
}

final class Service: ServiceProtocol{
  
    static let shared = Service()
    
    
    
    func getPokemons(onSuccess: @escaping (PokemonModel?) -> (), onError: @escaping (Alamofire.AFError) -> ()) {
        NetworkManager.shared.request(path: NetworkHelper.shared.pokemonURL()) { (response:PokemonModel?) in
            onSuccess(response)
        } onError: { error in
            onError(error)
        }
        
    }
   
    func getPhotos(url: String, onSuccess: @escaping (Photo?) -> (), onError: @escaping (Alamofire.AFError) -> ()) {
        NetworkManager.shared.request(path: url) { (response:Photo?)  in
            onSuccess(response)
        } onError: { error in
            onError(error)
        }

    }
    func getAbilities(url: String, onSuccess: @escaping (DetailModel?) -> (), onError: @escaping (Alamofire.AFError) -> ()) {
        NetworkManager.shared.request(path: url) { (response: DetailModel?) in
            onSuccess(response)
        } onError: { error in
            onError(error)
        }

    }
    
    
    
}
