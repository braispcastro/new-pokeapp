//
//  HomeModels.swift
//  new-pokeapp
//
//  Created by Castro, Brais on 15/11/21.
//

import Foundation
import UIKit

enum Home {
    
    struct ViewModel: Equatable {
        let title: String
    }
    
    struct ViewModelPokemon: Equatable {
        var number: String?
        var name: String
        var sprite: UIImage?
        var url: String
    }
    
    struct Pokemon: Decodable {
        let count: Int?
        let next: String?
        let previous: String?
        let results: [PokemonResult]?
    }
    
    struct PokemonResult: Decodable {
        let number: String?
        let name: String
        let sprite: String?
        let url: String
    }
    
    struct PokemonInfo: Decodable {
        
        enum CodingKeys: String, CodingKey {
            case id
            case name
            case height
            case weight
            case baseExperience = "base_experience"
            case sprites
        }
        
        let id: Int32
        let name: String
        let height: Int32
        let weight: Int32
        let baseExperience: Int32
        let sprites: Sprites?
    }
    
    struct Sprites: Decodable {
        
        enum CodingKeys: String, CodingKey {
            case front = "front_default"
            case back = "back_default"
        }
        
        let front: String
        let back: String
    }
}
