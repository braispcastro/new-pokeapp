//
//  InformationBuilder.swift
//  new-pokeapp
//
//  Created by Castro, Brais on 18/11/21.
//

import Foundation
import UIKit.UIViewController

final class InformationBuilder {
    
    func build(pokemon: Home.PokemonInfo) -> UIViewController {
        
        let viewController: InformationViewController = InformationViewController()
        let router: InformationRouter = InformationRouter(viewController: viewController)
        let interactor: InformationInteractor = InformationInteractor()
        let presenter: InformationPresenter = InformationPresenter(
            viewController: viewController,
            router: router,
            interactor: interactor,
            pokemon: pokemon)
        
        viewController.presenter = presenter
        interactor.presenter = presenter
        
        return viewController
    }
    
}
