//
//  HomeView.swift
//  PokemonAPI
//
//  Created by atakan yetkin on 22.03.2023.
//

import UIKit
import SnapKit

 final class HomeView: UIView {
     
//     MARK: - UI
     lazy var firstCollectionView: UICollectionView = {
         let layout = UICollectionViewFlowLayout()
         layout.scrollDirection = .vertical
         layout.minimumLineSpacing = 10
         layout.minimumInteritemSpacing = 10
         let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
         collection.showsVerticalScrollIndicator = false
         collection.register(FirstCollectionCell.self, forCellWithReuseIdentifier: FirstCollectionCell.identifier)
         return collection
     }()
     
     
//     MARK: - INIT METHOD
     override init(frame: CGRect) {
         super.init(frame: frame)
         configureView()
     }
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
     
        
        
     func configureView() {
             addSubview()
             setupConstraints()
             
        
     }
     private func addSubview(){
         addSubview(firstCollectionView)
     }
     
     private func setupConstraints(){
         firstCollectionView.snp.makeConstraints { make in
             make.top.leading.bottom.right.equalTo(safeAreaLayoutGuide)
         }
     }

}
