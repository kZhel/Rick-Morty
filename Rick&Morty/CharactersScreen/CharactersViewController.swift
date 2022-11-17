//
//  CharactersViewController.swift
//  Rick&Morty
//
//  Created by Katya on 07.11.2022.
//  Copyright © 2022 Katya. All rights reserved.
//

import UIKit

final class CharactersViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainThemeColor
//        addCollectionCell()
        setupNavigationBar()
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
        navigationItem.searchController = searchController
        navigationController?.navigationBar.barTintColor = .mainThemeColor

    }
//    private func addCollectionCell(){
//        let cardsHorizontalController = CollectionViewController()
//
//        self.addChild(cardsHorizontalController)
//        self.view.addSubview(cardsHorizontalController.view)
//        self.didMove(toParent: cardsHorizontalController)
//    }
    @objc private func filterButtonTapped(){
        print("filterButtonTapped")
    }
    
}
class CollectionViewController:UICollectionViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    private func setupCollectionView(){
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CellId")
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)-> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath)
        cell.backgroundColor = .yellow
        return cell
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
