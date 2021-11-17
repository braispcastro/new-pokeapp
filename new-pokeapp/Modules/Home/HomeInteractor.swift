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
}

protocol HomeInteractorCallbackProtocol {
    func fillPokemonList(pokemonList: [Home.ViewModelPokemon])
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
}
