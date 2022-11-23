//
//  EpisodeViewController.swift
//  Rick&Morty
//
//  Created by Katy on 17.11.2022.
//  Copyright © 2022 Katya. All rights reserved.
//
//import UIKit
//
//final class EpisodeViewController: UIViewController {
//    var episodeCollectionView:UICollectionView?
//
//    let dataModel = ["dog", "lion", "cat", "dog", "lion", "cat",  "dog", "lion", "cat", "dog", "lion", "cat", "dog", "lion", "cat", "dog", "lion", "cat", "dog", "lion", "cat", "dog", "lion", "cat"]
//    var imageView = UIImageView()
//    var blurEffect = UIVisualEffectView()
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .mainThemeColor
//        setupNavigationBar()
//        setupGeneralBar()
//        episodeCollectionView?.register(EpisodeCustomCell.self, forCellWithReuseIdentifier: "ccell")
//
//    }
//
////    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
////        return dataModel.count
////    }
////    override func collectionView(_ collectionView: UICollectionView, cellForIteamAt indexPath: IndexPath) -> UICollectionViewCell {
////        _ = collectionView.dequeueReusableCell(withReuseIdentifier: "ccell", for: indexPath) as! EpisodeCustomCell
////        cell.imageView.image = UIImage(named: "\(dataModel[indexPath.item]).jpeg")
////
////        return cell
////
////    }
//
//    private func setupNavigationBar(){
//        createCustomNavigationBarE()
//        let titleLable = UILabel()
//        titleLable.text = "Episodes"
//        titleLable.font = UIFont.systemFont(ofSize: 17, weight: .medium)
//        titleLable.textColor = .green
//        navigationItem.titleView = titleLable
//    }
//    private func setupGeneralBar(){
//
//
//
//        imageView = UIImageView(frame: self.view.bounds)
//        imageView.image = UIImage(named : "background.jpg")
//        imageView.contentMode = .scaleAspectFill
//        self.view.addSubview(imageView)
//
//        let effect = UIBlurEffect(style: .light)
//        blurEffect = UIVisualEffectView(effect: effect)
//        blurEffect.frame = imageView.bounds
//        self.view.addSubview(blurEffect)
//
//
//
////    let view=UIView()
////    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
////       layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
////       layout.itemSize=CGSize(width: 60, height: 60)
////
////        episodeCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
////        episodeCollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
////        episodeCollectionView?.backgroundColor = .mainThemeColor
////
//////          episodeCollectionView?.dataSource = self
//////          episodeCollectionView?.delegate = self
////
////        view.didAddSubview(episodeCollectionView ?? UICollectionView())
////        self.view = view
////
////
////
//
//
//    }
//}
//extension UIViewController{
//    func createCustomNavigationBarE(){
//        navigationController?.navigationBar.barTintColor = .mainThemeColor
//        navigationController?.navigationBar.tintColor = UIColor.green;
//
//    }
//    func createCustomBarButtonE(image: UIImage, selector: Selector)->UIBarButtonItem{
//        let button = UIButton()
//        button.setImage(image, for: .normal)
//        button.addTarget(self, action: selector, for: .touchUpInside)
//
//        let menuBarButton = UIBarButtonItem(customView: button)
//        return menuBarButton
//    }
//}


import UIKit
import SwiftUI
final class EpisodeViewController: UIViewController {
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
        titleLable.text = "Episodes"
        titleLable.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        titleLable.textColor = .green
        navigationItem.titleView = titleLable
    }
   
    private func setupCollectionView(){
        myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: createLayout())
        myCollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        myCollectionView?.register(EpisodeCustomCell.self, forCellWithReuseIdentifier: EpisodeCustomCell.reuseId)
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

 extension EpisodeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: EpisodeCustomCell.reuseId, for: indexPath) as! EpisodeCustomCell
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
