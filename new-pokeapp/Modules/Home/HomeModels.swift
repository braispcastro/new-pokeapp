//
//  HomeModels.swift
//  new-pokeapp
//
//  Created by Castro, Brais on 15/11/21.
//

import Foundation

enum Home {
    
    struct ViewModel: Equatable {
        let title: String
    }
    
    struct ViewModelPokemon: Equatable, Decodable {
        let name: String
        let url: String
    }
    
    struct Pokemon: Decodable {
        let count: Int?
        let next: String?
        let previous: String?
        let results: [ViewModelPokemon]?
    }
}
