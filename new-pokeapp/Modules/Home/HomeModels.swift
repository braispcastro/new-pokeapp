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
        var frontSprite: UIImage?
        var backSprite: UIImage?
        var height: String?
        var weight: String?
        var baseExperience: String?
        var url: String
        
        init(number: String?, name: String, frontSprite: UIImage?, backSprite: UIImage?, height: String?, weight: String?, baseExperience: String?, url: String) {
            self.number = number
            self.name = name
            self.frontSprite = frontSprite
            self.backSprite = backSprite
            self.height = height
            self.weight = weight
            self.baseExperience = baseExperience
            self.url = url
        }
        
        // for unit testing
        init() {
            self.number = "0"
            self.name = "Unknown"
            self.frontSprite = UIImage()
            self.backSprite = UIImage()
            self.height = "0"
            self.weight = "0"
            self.baseExperience = "0"
            self.url = "https://pokeapi.co/api/v2/pokemon/ditto"
        }
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
