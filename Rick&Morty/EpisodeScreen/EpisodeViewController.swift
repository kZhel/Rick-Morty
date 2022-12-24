import UIKit
import SwiftUI
final class EpisodeViewController: UIViewController {
    var myCollectionView:UICollectionView?
    let rmClient = RMClient()
    var episodeArr: [EpisodeModel]?
    override func viewDidLoad() {
        let view = UIView()
        super.viewDidLoad()
        view.backgroundColor = .mainThemeColor
        getEpisode()
        setupNavigationBar()
        setupCollectionView()

    }
    func getEpisode(){
        rmClient.episode().getAllEpisodes() {[weak self] result in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let episode):
                    self.episodeArr = episode
                    self.success()
                case.failure(let error):
                    self.failure(error: error)
                }
            }
        }
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
    
}

 extension EpisodeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return episodeArr?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: EpisodeCustomCell.reuseId, for: indexPath) as! EpisodeCustomCell
        myCell.photoImage(name: episodeArr?[indexPath.row].name ?? "", episode: episodeArr?[indexPath.row].episode ?? "", airDate: episodeArr?[indexPath.row].airDate ?? "")
        myCell.layer.cornerRadius = 6
        return myCell
    }
}

extension EpisodeViewController: CharactersViewProtocol{
    func success() {
        myCollectionView?.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
    
    
}
