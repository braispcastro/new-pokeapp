//
//  HomeInteractor.swift
//  new-pokeapp
//
//  Created by Castro, Brais on 16/11/21.
//

import Foundation
import Alamofire

protocol HomeInteractorProtocol {
    func getPokemonList()
    func completePokemonInfo(pokemonList: [Home.PokemonResult])
}

protocol HomeInteractorCallbackProtocol {
    func fillPokemonList(pokemonList: [Home.ViewModelPokemon])
    func showError(titleError: String, descriptionError: String)
}

class HomeInteractor {

    var presenter: HomeInteractorCallbackProtocol!
    private let baseUrl = "https://pokeapi.co/api/v2"
    
}

extension HomeInteractor: HomeInteractorProtocol {
    
    func getPokemonList() {
        let url = "\(baseUrl)/pokemon?limit=151"
        AF.request(url, method: .get)
            .validate(statusCode: 200...299)
            .responseDecodable(of: Home.Pokemon.self) { response in
                if let pokemonList = response.value?.results {
                    self.completePokemonInfo(pokemonList: pokemonList)
                } else {
                    self.presenter.showError(titleError: "Error", descriptionError: "Error description placeholder")
                }
        }
    }
    
    func completePokemonInfo(pokemonList: [Home.PokemonResult]) {
        
        var list: [Home.ViewModelPokemon] = []
        var counter = pokemonList.count
        
        for (index, pokemon) in pokemonList.enumerated() {
            AF.request(pokemon.url, method: .get)
                .validate(statusCode: 200...299)
                .responseDecodable(of: Home.PokemonInfo.self) { response in
                    if let response = response.value {
                        let item = Home.ViewModelPokemon(
                            number: String(response.id),
                            name: response.name,
                            frontSprite: ImageService.shared.getImageFromURL(url: response.sprites?.front),
                            backSprite: ImageService.shared.getImageFromURL(url: response.sprites?.back),
                            height: String(response.height),
                            weight: String(response.weight),
                            baseExperience: String(response.baseExperience),
                            url: pokemonList[index].url)
                        list.append(item)
                    }
                    
                    counter-=1
                    if (counter < 1) {
                        self.presenter.fillPokemonList(pokemonList: list)
                    }
                }
        }
    }
    
}
