
import UIKit
import SwiftUI
protocol CharactersViewProtocol {
    func success()
    func failure(error: Error)
}
final class CharactersViewController: UIViewController, UISearchBarDelegate {
    var myCollectionView:UICollectionView?
    let rmClient = RMClient()
    var charactersArr: [CharacterModel]?
    var charactersActualData: [CharacterModel]?
    private var photos = #imageLiteral(resourceName: "tumblr_n45cr8dmj61ty0km0o7_1280")
    override func viewDidLoad() {
        let view = UIView()
        super.viewDidLoad()
        view.backgroundColor = .mainThemeColor
        getCharacters()
        setupNavigationBar()
        setupCollectionView()
        setupSearchBar()
    }
    func getCharacters(){
        rmClient.character().getAllCharacters() {[weak self] result in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let characters):
                    self.charactersArr = characters
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
        searchController.searchBar.delegate = self
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        charactersActualData = charactersArr
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        charactersArr = charactersActualData?.filter { $0.name.lowercased().contains(searchText.lowercased())}
        myCollectionView?.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        charactersArr = charactersActualData
        myCollectionView?.reloadData()
        charactersActualData = nil
    }
    
    private func setupCollectionView(){
        myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: createLayout())
        myCollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        myCollectionView?.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.reuseId)
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
        let viewToFilter = self;
        let swiftUIView = FiltrationView.getInstance(charViewToFilter: viewToFilter) // swiftUIView is View
        let viewCtrl = UIHostingController(rootView: swiftUIView)
        navigationController?.pushViewController(viewCtrl, animated: true)
        
    }
    
    public func setFiltration(status: String, gender: String) { //todo: chto takoe completion hz (i kak menyat raskladku na ebanom apple?)
        let characters = self.rmClient.character();
        let filter = characters.createCharacterFilter(name: nil, status: Status(rawValue: status), species: nil, type: nil, gender: Gender(rawValue: gender))
        
        characters.getCharactersByFilter(filter: filter) {[weak self] result in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let characters):
                    self.charactersArr = characters
                    self.success()
                case.failure(let error):
                    self.failure(error: error)
                }
            }
        }
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
        return charactersArr?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.reuseId, for: indexPath) as! PhotoCell
        
        myCell.photoImage(text: charactersArr?[indexPath.row].name ?? "", imageURL: charactersArr?[indexPath.row].image ?? "")
        myCell.layer.cornerRadius = 6
        return myCell
    }
}
extension CharactersViewController: CharactersViewProtocol{
    func success() {
        myCollectionView?.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
    
    
}
