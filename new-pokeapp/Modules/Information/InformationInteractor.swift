//
//  InformationInteractor.swift
//  new-pokeapp
//
//  Created by Castro, Brais on 18/11/21.
//

import Foundation

protocol InformationInteractorProtocol {
    
}

protocol InformationInteractorCallbackProtocol {
    
}

class InformationInteractor {
    var presenter: InformationInteractorCallbackProtocol!
}

extension InformationInteractor: InformationInteractorProtocol {
    
}
