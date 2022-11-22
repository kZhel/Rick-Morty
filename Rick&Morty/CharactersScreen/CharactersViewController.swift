//
//  CharactersViewController.swift
//  Rick&Morty
//
//  Created by Katya on 07.11.2022.
//  Copyright © 2022 Katya. All rights reserved.
//

import UIKit
import SwiftUI
final class CharactersViewController: UIViewController {
    var myCollectionView:UICollectionView?
    private var photos = #imageLiteral(resourceName: "tumblr_n45cr8dmj61ty0km0o7_1280")
    override func viewDidLoad() {
        let view = UIView()
        super.viewDidLoad()
        view.backgroundColor = .mainThemeColor
        setupNavigationBar()
        setupCollectionView()
        setupSearchBar()

    }
    private func setupNavigationBar(){
        createCustomNavigationBar()
        let titleLable = UILabel()
        titleLable.text = "Characters"
        titleLable.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        titleLable.textColor = .green
        navigationItem.titleView = titleLable
        let filterButton = createCustomBarButton(image: #imageLiteral(resourceName: "filter"), selector: #selector(filterButtonTapped))
        navigationItem.rightBarButtonItem = filterButton
    }
    private func setupSearchBar(){
        let searchController = UISearchController(searchResultsController: nil)
        searchController.extendedLayoutIncludesOpaqueBars = true
        navigationItem.searchController = searchController
        navigationController?.navigationBar.backgroundColor = .mainThemeColor
        navigationItem.hidesSearchBarWhenScrolling = false
        
    }
    private func setupCollectionView(){
        myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: createLayout())
        myCollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        myCollectionView?.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.reuseId)
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

extension UIViewController{
    func createCustomNavigationBar(){
        navigationController?.navigationBar.barTintColor = .mainThemeColor
        navigationController?.navigationBar.tintColor = UIColor.green;
        
    }
    func createCustomBarButton(image: UIImage, selector: Selector)->UIBarButtonItem{
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.addTarget(self, action: selector, for: .touchUpInside)
        
        let menuBarButton = UIBarButtonItem(customView: button)
        return menuBarButton
    }
}
extension CharactersViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.reuseId, for: indexPath) as! PhotoCell
        myCell.photoImage
//        myCell.backgroundColor = UIColor.green
        myCell.layer.cornerRadius = 6
        return myCell
    }
}
//extension CharactersViewController: UICollectionViewDelegateFlowLayout{
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize.init(width: (view.bounds.width-20)/3, height: (view.bounds.height-30)/5)
//    }
//}
