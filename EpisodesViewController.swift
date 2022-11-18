////
////  EpisodesViewController.swift
////  Rick&Morty
////
////  Created by Katy on 17.11.2022.
////  Copyright © 2022 Katya. All rights reserved.
////
//import UIKit
//
//final class EpisodesViewController: UIViewController {
//    var episodesCollectionView:UICollectionView?
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
//        
//    }
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
////        episodesCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
////        episodesCollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
////        episodesCollectionView?.backgroundColor = .mainThemeColor
////
//////          episodesCollectionView?.dataSource = self
//////          episodesCollectionView?.delegate = self
////
////        view.didAddSubview(episodesCollectionView ?? UICollectionView())
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
