//
//  HomeRouter.swift
//  new-pokeapp
//
//  Created by Castro, Brais on 16/11/21.
//

import Foundation
import UIKit.UIViewController

protocol HomeRouterProtocol {
    func navigateToInformation(pokemon: Home.PokemonInfo)
}

class HomeRouter: HomeRouterProtocol {
    
    unowned let viewController: UIViewController
    
    internal var navigationController: UINavigationController? {
        return viewController.navigationController
    }
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func navigateToInformation(pokemon: Home.PokemonInfo) {
        self.viewController.navigationController?.pushViewController(InformationBuilder().build(pokemon: pokemon), animated: true)
    }

}
