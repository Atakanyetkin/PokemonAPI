//
//  FirstCellViewModel.swift
//  PokemonAPI
//
//  Created by atakan yetkin on 22.03.2023.
//

import Foundation


protocol FirstCellViewModelDelegate: AnyObject {
    
    func didFetchPhotoURL(url: String)
    func didOccurError(_ error: Error)
}

final class FirstCellViewModel {
    
    private let webServiceManager = Service.shared
    
    weak var delegate: FirstCellViewModelDelegate?
    
    var photoURL: String?
    
    func getPhotos(url: String) {
        webServiceManager.getPhotos(url: url) { photo in
            if let photo = photo?.sprites?.frontDefault {
                self.photoURL = photo
                if let photoURL = self.photoURL {
                    self.delegate?.didFetchPhotoURL(url: photoURL)
                }
                
            }
        } onError: { error in
            self.delegate?.didOccurError(error)
        }
        
    }
    
}

