//
//  InformationModels.swift
//  new-pokeapp
//
//  Created by Castro, Brais on 18/11/21.
//

import Foundation

enum Information {
    
    struct ViewModel: Equatable {
        let title: String
        let number: String
        let name: String
        let height: String
        let weight: String
        let baseExperience: String
        let frontImage: String?
        let backImage: String?
        
        init(pokemon: Home.PokemonInfo) {
            title = "[#\(pokemon.id)] \(pokemon.name.uppercased())"
            number = "Number: \(String(pokemon.id))"
            name = "Name: \(pokemon.name.capitalize())"
            height = "Height: \(String(pokemon.height))"
            weight = "Weight: \(String(pokemon.weight))"
            baseExperience = "Base experience: \(String(pokemon.baseExperience))"
            frontImage = pokemon.sprites?.front
            backImage = pokemon.sprites?.back
        }
    }
    
}
