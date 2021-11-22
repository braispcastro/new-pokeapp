//
//  InformationPresenterTest.swift
//  new-pokeappTests
//
//  Created by Castro, Brais on 22/11/21.
//

import XCTest
import Nimble
@testable import new_pokeapp

class InformationPresenterTest: XCTestCase {
    
    //private var sut: InformationPresenter<SpyViewController, SpyRouter>!
    private var sut: InformationPresenter!
    private var spyRouter: SpyRouter!
    private var spyViewController: SpyViewController!
    private var mockInformationInteractor: MockInformationInteractor!
    
    override func setUp() {
        super.setUp()
        spyViewController = SpyViewController()
        spyRouter = SpyRouter()
        mockInformationInteractor = MockInformationInteractor()
        givenSut()
    }

    override func tearDown() {
        spyViewController = nil
        spyRouter = nil
        sut = nil
        mockInformationInteractor = nil
        super.tearDown()
    }
    
    // MARK: - Private methods
    
    private func givenSut(pokemon: Home.ViewModelPokemon = Home.ViewModelPokemon()) {
        sut = InformationPresenter(
            viewController: spyViewController,
            router: spyRouter,
            interactor: mockInformationInteractor,
            pokemon: pokemon)
    }
    
    // MARK: - Public methods
    
    // TODO: Tests...
}

private class SpyViewController: InformationViewControllerProtocol {
    
    var viewModel: Information.ViewModel?
    var showCalled: Int = 0
    
    func show(viewModel: Information.ViewModel) {
        self.viewModel = viewModel
        showCalled += 1
    }
    
}

private class SpyRouter: InformationRouterProtocol {
    // No need...
}

private final class MockInformationInteractor: InformationInteractorProtocol {
    // No need...
}
