//
//  LocationViewController.swift
//  Rick&Morty
//
//  Created by Katya on 13.11.2022.
//  Copyright © 2022 Katya. All rights reserved.
//
import UIKit
import SwiftUI
final class LocationViewController: UIViewController {
    var myCollectionView:UICollectionView?
    override func viewDidLoad() {
        let view = UIView()
        super.viewDidLoad()
        view.backgroundColor = .mainThemeColor
        setupNavigationBar()
        setupCollectionView()

    }
    private func setupNavigationBar(){
        createCustomNavigationBar()
        let titleLable = UILabel()
        titleLable.text = "Locations"
        titleLable.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        titleLable.textColor = .green
        navigationItem.titleView = titleLable
    }
   
    private func setupCollectionView(){
        myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: createLayout())
        myCollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        myCollectionView?.register(LocationCell.self, forCellWithReuseIdentifier: LocationCell.reuseId)
        //collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        myCollectionView?.backgroundColor = .mainThemeColor
        myCollectionView?.dataSource = self
        myCollectionView?.delegate = self
        view.addSubview(myCollectionView ?? UICollectionView())
        
        self.view = view
    }
    private func createLayout() -> UICollectionViewLayout{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
        group.interItemSpacing = .fixed(10)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }

    @objc private func filterButtonTapped(){
        let swiftUIView = ContentView() // swiftUIView is View
        let viewCtrl = UIHostingController(rootView: swiftUIView)
//        let charachterVC = CharactersViewController()
        navigationController?.pushViewController(viewCtrl, animated: true)
        
        
    }
    
}

 extension LocationViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: LocationCell.reuseId, for: indexPath) as! LocationCell
        myCell.photoImage
//        myCell.backgroundColor = UIColor.green
        myCell.layer.cornerRadius = 6
        return myCell
    }
}


