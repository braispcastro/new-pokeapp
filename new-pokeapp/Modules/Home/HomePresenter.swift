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
            self.interactor = interactor
            self.viewController = viewController
            self.router = router
        }
    
}

extension HomePresenter: HomePresenterProtocol {
    
    func prepareView() {
        let viewModel = Home.ViewModel(title: "Pokemon APP")
        self.viewController.show(viewModel: viewModel)
        interactor.getPokemonList()
    }
    
    func pokemonSelected(url: String) {
        self.router.navigateToInformation()
    }
}

extension HomePresenter: HomeInteractorCallbackProtocol {
    
    func fillPokemonList(pokemonList: [Home.ViewModelPokemon]) {
        viewController.showPokemons(viewModel: pokemonList)
    }
    
}
