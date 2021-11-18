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
    func getPokemonInfo(url: String)
}

protocol HomeInteractorCallbackProtocol {
    func fillPokemonList(pokemonList: [Home.ViewModelPokemon])
    func showPokemonInformation(pokemon: Home.PokemonInfo)
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
                    self.presenter.fillPokemonList(pokemonList: pokemonList)
                } else {
                    // Show error...
                }
        }
    }
    
    func getPokemonInfo(url: String) {
        AF.request(url, method: .get)
            .validate(statusCode: 200...299)
            .responseDecodable(of: Home.PokemonInfo.self) { response in
                if let pokemon = response.value {
                    self.presenter.showPokemonInformation(pokemon: pokemon)
                } else {
                    // Show error...
                }
        }
    }
    
}
