//
//  DetailViewModel.swift
//  PokemonAPI
//
//  Created by atakan yetkin on 22.03.2023.
//

import Foundation

protocol DetailViewModelDelegete: AnyObject {
    
    func didFetchAbilities()
    func didFetchPhoto(url: String)
    
    func didOccurError(_ error: Error)
        
    
}

final class DetailViewModel {
    
    private let webServiceManager = Service.shared
    
    weak var delegate: DetailViewModelDelegete?
    
    
    var abilities = [Ability]()
    var photoURL: String?
    
    func getAbilities(url: String) {
        
        webServiceManager.getAbilities(url: url) { detail in
            if let abilities = detail?.abilities {
                
                self.abilities = abilities
                
                self.delegate?.didFetchAbilities()
            }
        } onError: { error in
            self.delegate?.didOccurError(error)
        }

        
    }
    
    func getPhoto(url: String) {
        webServiceManager.getPhotos(url: url) { photo in
            if let photo = photo?.sprites?.frontDefault {
                
                self.photoURL = photo
                if let photoURL = self.photoURL {
                    self.delegate?.didFetchPhoto(url: photoURL)
                    
                }
            }
        
        } onError: { error in
            self.delegate?.didOccurError(error)
        }

    }
}
