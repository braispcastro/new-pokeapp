//
//  String.swift
//  new-pokeapp
//
//  Created by Castro, Brais on 18/11/21.
//

import Foundation

extension String {
    
    func capitalize() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
    mutating func capitalize() {
        self = self.capitalize()
    }
    
}
