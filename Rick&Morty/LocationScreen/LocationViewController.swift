import UIKit
import SwiftUI
final class LocationViewController: UIViewController {
    var myCollectionView:UICollectionView?
    let rmClient = RMClient()
    var locationArr: [LocationModel]?
    override func viewDidLoad() {
        let view = UIView()
        super.viewDidLoad()
        view.backgroundColor = .mainThemeColor
        getLocation()
        setupNavigationBar()
        setupCollectionView()

    }
    func getLocation(){
        rmClient.location().getAllLocations() {[weak self] result in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let location):
                    self.locationArr = location
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
        titleLable.text = "Locations"
        titleLable.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        titleLable.textColor = .green
        navigationItem.titleView = titleLable
    }
   
    private func setupCollectionView(){
        myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: createLayout())
        myCollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        myCollectionView?.register(LocationCustomCell.self, forCellWithReuseIdentifier: LocationCustomCell.reuseId)
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

 extension LocationViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return locationArr?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: LocationCustomCell.reuseId, for: indexPath) as! LocationCustomCell
        myCell.photoImage(name: locationArr?[indexPath.row].name ?? "", type: locationArr?[indexPath.row].type ?? "", dimention: locationArr?[indexPath.row].dimension ?? "")
        myCell.layer.cornerRadius = 6
        return myCell
    }
}

extension LocationViewController: CharactersViewProtocol{
    func success() {
        myCollectionView?.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
    
    
}
