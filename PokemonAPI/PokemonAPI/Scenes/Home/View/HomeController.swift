//
//  HomeController.swift
//  PokemonAPI
//
//  Created by atakan yetkin on 21.03.2023.
//

import UIKit


class HomeController: UIViewController {

//   MARK: - References
    private let viewModel = HomeViewModel()
    private let homeView = HomeView()
    
    override func loadView() {
        super.loadView()
        
    title = "POKEAPI"
        
        view = homeView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    

        viewModel.fetchPokemons()
        view.backgroundColor = .systemGreen
      
    }
    private func configureViewController() {
        setupDelegates()
    }
     
  
    private func setupDelegates() {
        homeView.firstCollectionView.delegate = self
        homeView.firstCollectionView.dataSource = self
        viewModel.delegate = self
    }
        
    
 
    
}
extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return viewModel.pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = homeView.firstCollectionView.dequeueReusableCell(withReuseIdentifier: FirstCollectionCell.identifier, for: indexPath) as? FirstCollectionCell else { return UICollectionViewCell()}
        
        cell.configure(viewModel.pokemons[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let url = viewModel.pokemons[indexPath.row].url, let name = viewModel.pokemons[indexPath.row].name {
            let vc = DetailController(url: url, name: name)
            navigationController?.pushViewController(vc, animated: true)
        }
    
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: homeView.firstCollectionView.frame.width / 2 - 20 , height: homeView.firstCollectionView.frame.height / 6)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    
    
}
extension HomeController: HomeViewModelDelegate {
    func didFetchPokemons() {
        homeView.firstCollectionView.reloadData()
    }
    
    func didOccurError(_ error: Error) {
        print(error)
    }
    
    
}
