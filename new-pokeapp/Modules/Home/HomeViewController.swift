//
//  HomeViewController.swift
//  new-pokeapp
//
//  Created by Castro, Brais on 15/11/21.
//

import UIKit

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
        pokemonTableView.register(UITableViewCell.self, forCellReuseIdentifier: "pkmn")
        
        pokemonTableView.reloadData()
    }
    
    func showPokemons(viewModel: [Home.ViewModelPokemon]) {
        self.pokemons = viewModel
        pokemonTableView.reloadData()
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = pokemonTableView.dequeueReusableCell(withIdentifier: "pkmn") else {
            return UITableViewCell(style: .default, reuseIdentifier: "pkmn")
        }
        
        cell.textLabel?.text = pokemons?[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.pokemonSelected(url: (pokemons?[indexPath.row].url)!)
    }
    
}
