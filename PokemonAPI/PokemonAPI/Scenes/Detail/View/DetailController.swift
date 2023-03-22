//
//  DetailController.swift
//  PokemonAPI
//
//  Created by atakan yetkin on 22.03.2023.
//

import UIKit

class DetailController: UIViewController {

    private let detailView = DetailView()
    private let viewModel = DetailViewModel()
    
    init(url: String, name: String) {
        super.init(nibName: nil, bundle: nil)
        viewModel.getAbilities(url: url)
        viewModel.getPhoto(url: url)
        detailView.nameLabel.text = name
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = detailView
        
        title = "Detail"
        
    }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()

    }
    
    func configureViewController() {
        setupDelegate()
        
    }
    
    func setupDelegate() {
        
        detailView.tableView.delegate = self
        detailView.tableView.dataSource = self
        viewModel.delegate = self
    }
    
 }

extension DetailController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.abilities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
        
        cell.textLabel?.text = viewModel.abilities[indexPath.row].ability?.name
        
        return cell
    }
    
    
}

extension DetailController: DetailViewModelDelegete {
  
    func didFetchPhoto(url: String) {
        detailView.pokemonImageView.downloadSetImage(url: url)
        
    }
    
   
    func didFetchAbilities() {
        detailView.tableView.reloadData()
    }
    
    func didOccurError(_ error: Error) {
        print(error)
    }
    
    
}
