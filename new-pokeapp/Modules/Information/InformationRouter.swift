//
//  InformationRouter.swift
//  new-pokeapp
//
//  Created by Castro, Brais on 18/11/21.
//

import Foundation
import UIKit.UIViewController

protocol InformationRouterProtocol {
    
}

class InformationRouter: InformationRouterProtocol {
    
    unowned let viewController: UIViewController
    
    internal var navigationController: UINavigationController? {
        return viewController.navigationController
    }
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
}
