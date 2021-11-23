//
//  String.swift
//  new-pokeappTests
//
//  Created by Castro, Brais on 23/11/21.
//

import XCTest
import Nimble
@testable import new_pokeapp

class StringTest: XCTestCase {
    
    func test_capitalize_string() {
        let str = "hello".capitalize()
        
        expect(str).toEventually(equal("Hello"))
    }
    
}
