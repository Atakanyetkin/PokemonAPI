//
//  HomeViewModel.swift
//  PokemonAPI
//
//  Created by atakan yetkin on 22.03.2023.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func didFetchPokemons()
    func didOccurError(_ error: Error)
}

final class HomeViewModel {
//    MARK: - Values
    weak var delegate: HomeViewModelDelegate?
  
    
    // MARK: - Constants
    private let webServicesManager = Service.shared
    
    
//    MARK: - Variables
    var pokemons = [Pokemon]()
    
    func fetchPokemons() {
        webServicesManager.getPokemons { pokemons in
            if let pokemons = pokemons?.results {
                self.pokemons = pokemons
                self.delegate?.didFetchPokemons()
            }
            
        } onError: { error in
            
            self.delegate?.didOccurError(error)
        }
        
        

    }
    
 
}
