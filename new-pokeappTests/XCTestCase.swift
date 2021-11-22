//
//  XCTestCase.swift
//  new-pokeappTests
//
//  Created by Castro, Brais on 22/11/21.
//

import XCTest
import Nimble
@testable import new_pokeapp

class BaseTestCase: XCTestCase {
    
    override func setUp() {
        super.setUp()
        setNimbleConfiguration()
    }
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        setNimbleConfiguration()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    private func setNimbleConfiguration() {
        Nimble.AsyncDefaults.timeout = .seconds(10)
        Nimble.AsyncDefaults.pollInterval = .milliseconds(200)
    }
    
}

extension XCTestCase {
    
    func wait(until expectations: [XCTestExpectation]) {
        wait(for: expectations, timeout: 1.0)
    }
    
    func wait(for expectation: XCTestExpectation) {
        wait(for: [expectation], timeout: 1.0)
    }
    
}
