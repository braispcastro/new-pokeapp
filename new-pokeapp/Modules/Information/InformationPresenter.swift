//
//  InformationPresenter.swift
//  new-pokeapp
//
//  Created by Castro, Brais on 18/11/21.
//

import Foundation

protocol InformationViewControllerProtocol {
    func show(viewModel: Information.ViewModel)
}

protocol InformationPresenterProtocol {
    func prepareView()
}

final class InformationPresenter {
    let interactor: InformationInteractorProtocol
    let viewController: InformationViewControllerProtocol
    let router: InformationRouterProtocol
    let pokemon: Home.PokemonInfo
    
    init(viewController: InformationViewControllerProtocol,
         router: InformationRouterProtocol,
         interactor: InformationInteractorProtocol,
         pokemon: Home.PokemonInfo) {
        self.viewController = viewController
        self.router = router
        self.interactor = interactor
        self.pokemon = pokemon
    }
}

extension InformationPresenter: InformationPresenterProtocol {
    
    func prepareView() {
        let viewModel = Information.ViewModel(pokemon: pokemon)
        self.viewController.show(viewModel: viewModel)
    }
    
}

extension InformationPresenter: InformationInteractorCallbackProtocol {
    
}
