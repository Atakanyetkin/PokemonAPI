//
//  NetworkManager.swift
//  PokemonAPI
//
//  Created by atakan yetkin on 22.03.2023.
//

import Alamofire

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    public func request<T>(path: String, onSuccess: @escaping (T) -> (), onError: @escaping (AFError) -> ()) where T: Codable {
        
        AF.request(path, encoding: JSONEncoding.default).validate().responseDecodable(of: T.self) { response in
            
            guard let model = response.value else {print(response.error as Any); return}
            onSuccess(model)
            
 
        }
    }
    
    
}

