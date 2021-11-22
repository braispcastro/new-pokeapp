//
//  HomePresenterRouterTest.swift
//  new-pokeappTests
//
//  Created by Castro, Brais on 22/11/21.
//

import XCTest
import Nimble
@testable import new_pokeapp

class HomeRouterTest: BaseTestCase {
    
    private var sut: HomeRouter!
    private var nav: UINavigationController!
    
    override func setUp() {
        givenSut()
        super.setUp()
    }

    override func tearDown() {
        nav = nil
        sut = nil
        super.tearDown()
    }

    func test_user_navigates_to_information_view() {
        
        sut.navigateToInformation(pokemon: Home.ViewModelPokemon())
        expect(self.nav.visibleViewController).toEventually(beAKindOf(UIViewController.self))
    }
    
    private func givenSut(viewControllers: [UIViewController] = [UIViewController()]) {
        
        let controller = UIViewController()
        nav = UINavigationController(rootViewController: controller)
        sut = HomeRouter(viewController: controller)
    }
    
}
