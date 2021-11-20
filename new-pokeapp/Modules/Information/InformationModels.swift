//
//  InformationModels.swift
//  new-pokeapp
//
//  Created by Castro, Brais on 18/11/21.
//

import Foundation
import UIKit

enum Information {
    
    struct ViewModel: Equatable {
        let title: String
        let number: String
        let name: String
        let height: String
        let weight: String
        let baseExperience: String
        let frontImage: UIImage?
        let backImage: UIImage?
        
        init(pokemon: Home.ViewModelPokemon) {
            title = "[#\(pokemon.number!)] \(pokemon.name.uppercased())"
            number = "Number: \(pokemon.number!)"
            name = "Name: \(pokemon.name.capitalize())"
            height = "Height: \(pokemon.height!)"
            weight = "Weight: \(pokemon.weight!)"
            baseExperience = "Base experience: \(pokemon.baseExperience!)"
            frontImage = pokemon.frontSprite
            backImage = pokemon.backSprite
        }
    }
    
}
