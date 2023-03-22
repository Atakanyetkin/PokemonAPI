//
//  FirstCollectionCell.swift
//  PokemonAPI
//
//  Created by atakan yetkin on 22.03.2023.
//

import UIKit
import SnapKit

final class FirstCollectionCell: UICollectionViewCell {
    
    //    MARK: - Cells Identifier
    
    static let identifier = "FirstCollectionCell"
    
    //    MARK: - UI
    
    lazy var pokemonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
//        imageView.backgroundColor = .systemYellow
        
        return imageView
        
        
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        
        return label
    }()
    
    //    MARK: - References
    
    private let viewModel = FirstCellViewModel()
    
  
    
    //    MARK: - Init Method
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ data: Pokemon) {
        titleLabel.text = data.name
        if let url = data.url {
            
            viewModel.getPhotos(url: url)
            
        }
        
    }
    
    func configureCell() {
        backgroundColor = .systemGray6
        layer.cornerRadius = 15
        addSubview()
        setupConstraints()
        setupDelegate()
        
        
    }
    
    func setupDelegate() {
        viewModel.delegate = self
    }
    
    //    MARK: - Configure UI
    
    private func addSubview() {
        
        addSubview(pokemonImageView)
        addSubview(titleLabel)
        
    }
    
    private func setupConstraints(){
        
        pokemonImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(10)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-10)
            make.width.equalTo(safeAreaLayoutGuide.snp.height).offset(-20)
            
            
            
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(pokemonImageView.snp.centerY)
            make.leading.equalTo(pokemonImageView.snp.trailing).offset(10)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-10)
            
        }
    }
    
    
}
extension FirstCollectionCell: FirstCellViewModelDelegate {
    func didFetchPhotoURL(url: String) {
        pokemonImageView.downloadSetImage(url: url)
    }
    
    func didOccurError(_ error: Error) {
        print(error)
    }
    
    
}
