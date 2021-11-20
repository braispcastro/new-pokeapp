//
//  HomeViewController.swift
//  new-pokeapp
//
//  Created by Castro, Brais on 15/11/21.
//

import UIKit
import SwiftUI

final class HomeViewController: BaseViewController {

    @IBOutlet weak var pokemonTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var presenter: HomePresenterProtocol!
    private var viewModel: Home.ViewModel!
    private var pokemons: [Home.ViewModelPokemon]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.prepareView()
    }
}

extension HomeViewController: HomeViewControllerProtocol {
    
    func show(viewModel: Home.ViewModel) {
        self.viewModel = viewModel
        self.title = viewModel.title
        
        pokemonTableView.delegate = self
        pokemonTableView.dataSource = self
        
        let cell = UINib(nibName: "PokemonTableViewCell", bundle: nil)
        pokemonTableView.register(cell, forCellReuseIdentifier: "pkmn")
        
        pokemonTableView.reloadData()
        activityIndicator.startAnimating()
    }
    
    func showPokemons(viewModel: [Home.ViewModelPokemon]) {
        self.pokemons = viewModel
        pokemonTableView.reloadData()
        activityIndicator.stopAnimating()
    }
    
    func dialogError(titleError: String, descriptionError: String) {
        let dialogError = UIAlertController(title: titleError, message: descriptionError, preferredStyle: .alert)
        dialogError.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(dialogError, animated: true)
    }
    
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = pokemonTableView.dequeueReusableCell(withIdentifier: "pkmn") as? PokemonTableViewCell else {
            return PokemonTableViewCell(style: .default, reuseIdentifier: "pkmn")
        }
        
        cell.titleLabel.text = pokemons?[indexPath.row].name.capitalize()
        cell.subtitleLabel.text = "#\(pokemons?[indexPath.row].number ?? "")"
        cell.pokemonImage.image = pokemons?[indexPath.row].frontSprite
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.pokemonSelected(pokemon: (pokemons?[indexPath.row])!)
    }
    
}
