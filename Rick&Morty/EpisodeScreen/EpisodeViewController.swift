//
//  EpisodeViewController.swift
//  Rick&Morty
//
//  Created by Katy on 17.11.2022.
//  Copyright © 2022 Katya. All rights reserved.
//
import UIKit

final class EpisodeViewController: UIViewController {
    var episodeCollectionView:UICollectionView?
    
    let dataModel = ["dog", "lion", "cat", "dog", "lion", "cat",  "dog", "lion", "cat", "dog", "lion", "cat", "dog", "lion", "cat", "dog", "lion", "cat", "dog", "lion", "cat", "dog", "lion", "cat"]
    var imageView = UIImageView()
    var blurEffect = UIVisualEffectView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainThemeColor
        setupNavigationBar()
        setupGeneralBar()
        episodeCollectionView?.register(EpisodeCustomCell.self, forCellWithReuseIdentifier: "ccell")
        
    }
    
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return dataModel.count
//    }
//    override func collectionView(_ collectionView: UICollectionView, cellForIteamAt indexPath: IndexPath) -> UICollectionViewCell {
//        _ = collectionView.dequeueReusableCell(withReuseIdentifier: "ccell", for: indexPath) as! EpisodeCustomCell
//        cell.imageView.image = UIImage(named: "\(dataModel[indexPath.item]).jpeg")
//        
//        return cell
//        
//    }

    private func setupNavigationBar(){
        createCustomNavigationBarE()
        let titleLable = UILabel()
        titleLable.text = "Episodes"
        titleLable.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        titleLable.textColor = .green
        navigationItem.titleView = titleLable
    }
    private func setupGeneralBar(){
        
        
        
        imageView = UIImageView(frame: self.view.bounds)
        imageView.image = UIImage(named : "background.jpg")
        imageView.contentMode = .scaleAspectFill
        self.view.addSubview(imageView)

        let effect = UIBlurEffect(style: .light)
        blurEffect = UIVisualEffectView(effect: effect)
        blurEffect.frame = imageView.bounds
        self.view.addSubview(blurEffect)
       
        
        
//    let view=UIView()
//    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//       layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
//       layout.itemSize=CGSize(width: 60, height: 60)
//
//        episodeCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
//        episodeCollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
//        episodeCollectionView?.backgroundColor = .mainThemeColor
//
////          episodeCollectionView?.dataSource = self
////          episodeCollectionView?.delegate = self
//
//        view.didAddSubview(episodeCollectionView ?? UICollectionView())
//        self.view = view
//
//
//
        
        
    }
}
extension UIViewController{
    func createCustomNavigationBarE(){
        navigationController?.navigationBar.barTintColor = .mainThemeColor
        navigationController?.navigationBar.tintColor = UIColor.green;
        
    }
    func createCustomBarButtonE(image: UIImage, selector: Selector)->UIBarButtonItem{
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.addTarget(self, action: selector, for: .touchUpInside)
        
        let menuBarButton = UIBarButtonItem(customView: button)
        return menuBarButton
    }
}
