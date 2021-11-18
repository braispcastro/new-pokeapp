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
    }
    
    func showPokemons(viewModel: [Home.ViewModelPokemon]) {
        self.pokemons = viewModel
        pokemonTableView.reloadData()
    }
    
    func dialogError(titleError: String, descriptionError: String) {
        
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
        cell.pokemonImage.image = pokemons?[indexPath.row].sprite
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.pokemonSelected(url: (pokemons?[indexPath.row].url)!)
    }
    
}
