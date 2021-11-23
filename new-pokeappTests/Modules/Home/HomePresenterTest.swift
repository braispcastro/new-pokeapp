//
//  HomePresenterTest.swift
//  new-pokeappTests
//
//  Created by Castro, Brais on 22/11/21.
//

import XCTest
import Nimble
@testable import new_pokeapp

class HomePresenterTest: XCTestCase {
    
    private var sut: HomePresenter!
    private var spyRouter: SpyRouter!
    private var spyViewController: SpyViewController!
    private var mockHomeInteractor: MockHomeInteractor!
    
    override func setUp() {
        super.setUp()
        spyViewController = SpyViewController()
        spyRouter = SpyRouter()
        mockHomeInteractor = MockHomeInteractor()
        givenSut()
    }

    override func tearDown() {
        spyViewController = nil
        spyRouter = nil
        sut = nil
        mockHomeInteractor = nil
        super.tearDown()
    }
    
    // MARK: - Private methods
    
    private func givenSut() {
        sut = HomePresenter(
            viewController: spyViewController,
            router: spyRouter,
            interactor: mockHomeInteractor)
    }
    
    // MARK: - Test methods
    
    func test_user_enters_on_home_screen() {
        sut.prepareView()
        
        let expectedViewModel = Home.ViewModel(title: "Pokédex")
        
        expect(self.spyViewController.viewModel).toEventually(equal(expectedViewModel))
        expect(self.spyViewController.showCalled).toEventually(equal(1))
    }
    
    func test_user_selects_a_pokemon_and_goes_to_information_view() {
        sut.pokemonSelected(pokemon: Home.ViewModelPokemon())
        
        expect(self.spyRouter.navigateToInformationCalled).toEventually(beTrue())
    }
    
    func test_app_gets_pokemon_list_and_shows_with_no_error() {
        sut.fillPokemonList(pokemonList: [Home.ViewModelPokemon(), Home.ViewModelPokemon()])
        
        expect(self.spyViewController.showPokemonsCalled).toEventually(equal(1))
    }
    
    func test_app_fails_to_get_pokemon_list() {
        sut.showError(titleError: "Error", descriptionError: "Test placeholder")
        
        expect(self.spyViewController.dialogErrorCalled).toEventually(equal(1))
    }
}

private class SpyViewController: HomeViewControllerProtocol {
    
    var viewModel: Home.ViewModel?
    var showCalled: Int = 0
    var showPokemonsCalled: Int = 0
    var dialogErrorCalled: Int = 0
    
    func show(viewModel: Home.ViewModel) {
        self.viewModel = viewModel
        showCalled += 1
    }
    
    func showPokemons(viewModel: [Home.ViewModelPokemon]) {
        showPokemonsCalled += 1
    }
    
    func dialogError(titleError: String, descriptionError: String) {
        dialogErrorCalled += 1
    }
    
}

private class SpyRouter: HomeRouterProtocol {
    
    var navigateToInformationCalled = false
    
    func navigateToInformation(pokemon: Home.ViewModelPokemon) {
        navigateToInformationCalled = true
    }
    
}

private final class MockHomeInteractor: HomeInteractorProtocol {
    
    var getPokemonListCalled = false
    var completePokemonListCalled = false
    
    func getPokemonList() {
        getPokemonListCalled = true
    }
    
    func completePokemonInfo(pokemonList: [Home.PokemonResult]) {
        completePokemonListCalled = true
    }
    
}
