//
//  HomePresenter.swift
//  new-pokeapp
//
//  Created by Castro, Brais on 15/11/21.
//

import Foundation

protocol HomeViewControllerProtocol {
    func show(viewModel: Home.ViewModel)
    func showPokemons(viewModel: [Home.ViewModelPokemon])
    func dialogError(titleError: String, descriptionError: String)
}

protocol HomePresenterProtocol {
    func prepareView()
    func pokemonSelected(url: String)
}

final class HomePresenter {

    let interactor: HomeInteractorProtocol
    let viewController: HomeViewControllerProtocol
    let router: HomeRouterProtocol
    
    init(viewController: HomeViewControllerProtocol,
         router: HomeRouterProtocol,
         interactor: HomeInteractorProtocol) {
            self.viewController = viewController
            self.router = router
            self.interactor = interactor
        }
    
}

extension HomePresenter: HomePresenterProtocol {
    
    func prepareView() {
        let viewModel = Home.ViewModel(title: "Pokédex")
        viewController.show(viewModel: viewModel)
        interactor.getPokemonList()
    }
    
    func pokemonSelected(url: String) {
        interactor.getPokemonInfo(url: url)
    }
    
}

extension HomePresenter: HomeInteractorCallbackProtocol {
    
    func fillPokemonList(pokemonList: [Home.ViewModelPokemon]) {
        viewController.showPokemons(viewModel: pokemonList.sorted(by: { Int($0.number!)! < Int($1.number!)! } ))
    }
    
    func showPokemonInformation(pokemon: Home.PokemonInfo) {
        router.navigateToInformation(pokemon: pokemon)
    }
    
    func showError(titleError: String, descriptionError: String) {
        viewController.dialogError(titleError: titleError, descriptionError: descriptionError)
    }
    
}
