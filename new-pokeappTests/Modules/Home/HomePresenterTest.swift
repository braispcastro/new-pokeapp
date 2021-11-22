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
    
    //private var sut: HomePresenter<SpyViewController, SpyRouter>!
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
    
    // MARK: - Public methods
    
    // TODO: Tests...
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
