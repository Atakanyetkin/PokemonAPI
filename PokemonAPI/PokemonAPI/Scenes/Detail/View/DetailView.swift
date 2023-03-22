//
//  DetailView.swift
//  PokemonAPI
//
//  Created by atakan yetkin on 22.03.2023.
//

import UIKit

class DetailView: UIView {

//    MARK: - UI
    
    lazy var pokemonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    
        
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        return label
    }()
    
    
    lazy var tableView: UITableView = {
       let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    func configureView() {
        backgroundColor = .white
            addSubview()
            setupConstraints()
        
            
       
    }
    private func addSubview() {
        addSubview(pokemonImageView)
        addSubview(nameLabel)
        addSubview(tableView)
    }
    
    private func setupConstraints() {
        pokemonImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(safeAreaLayoutGuide.snp.height).multipliedBy(0.4)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(pokemonImageView.snp.centerX)
            make.top.equalTo(pokemonImageView.snp.bottom).offset(15)
            make.height.equalTo(safeAreaLayoutGuide.snp.height).multipliedBy(0.1)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom)
            make.leading.trailing.bottom.equalTo(safeAreaLayoutGuide)
        }
        
    }
    


    
    
}
