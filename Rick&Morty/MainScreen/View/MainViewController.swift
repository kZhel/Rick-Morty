////
////  ContentView.swift
////  Rick&Morty
////
////  Created by Katya on 07.11.2022.
////  Copyright © 2022 Katya. All rights reserved.
////
//
//import UIKit
//

//  Created by Katya on 07.11.2022.
//  Copyright © 2022 Katya. All rights reserved.
//



import UIKit

class MainViewController: UIViewController {

    // Dependencies

    // UI
    private let charactersButton = MainScreenButton(with: .characters)
    private let locationsButton = MainScreenButton(with: .locations)
    private let episodesButton = MainScreenButton(with: .episodes)

    // MARK: - Init

//    init(presenter: IMainScreenPresenter) {
//        self.presenter = presenter
//        super.init(nibName: nil, bundle: nil)
//    }

//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

    // MARK: - Lyfecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainThemeColor
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        setUpButton(button: charactersButton)
        setUpButton(button: locationsButton)
        setUpButton(button: episodesButton)
        
    }
    override func viewWillDisappear(_ animated: Bool) {
         self.navigationController?.setNavigationBarHidden(false, animated: animated); // <<
         super.viewWillDisappear(animated)
    }
}

// MARK: - MainScreenButtonDelegate

extension MainViewController: MainScreenButtonDelegate {

    func didTapMainScreenButton(with type: MainScreenButtonType) {
        switch type {
        case .characters:
            let charachterVC = CharactersViewController()
            navigationController?.pushViewController(charachterVC, animated: true)
        case .episodes:
            let episodeVC = EpisodeViewController()
            navigationController?.pushViewController(episodeVC, animated: true)
        case .locations:
            let charachterVC = CharactersViewController()
        }
        
    }
}

// MARK: - Private functions

private extension MainViewController {

    func setUpButton(button: MainScreenButton) {
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.delegate = self
        view.addSubview(button)
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.backgroundColor = .none
        label.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        button.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.widthAnchor.constraint(equalTo: button.widthAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: button.heightAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: button.bottomAnchor).isActive = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: view.frame.width * 0.9).isActive = true
        button.heightAnchor.constraint(equalToConstant: view.frame.height * 0.25).isActive = true
        

        switch button.type {
        case .characters:
            label.text = "Characters"
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        case .locations:
            label.text = "Locations"
            button.topAnchor.constraint(equalTo: charactersButton.bottomAnchor, constant: 30).isActive = true
        case .episodes:
            label.text = "Episodes"
            button.topAnchor.constraint(equalTo: locationsButton.bottomAnchor, constant: 30).isActive = true
        }
    }
}

//import UIKit
//
//class MainViewController: UIViewController{
//    private let testButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("Characters", for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//    private let testButton2: UIButton = {
//        let button = UIButton()
//        button.setTitle("Episodes", for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//    private let testButton3: UIButton = {
//        let button = UIButton()
//        button.setTitle("Locations", for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .yellow
//        setupButton()
//        setConstraints()
//        testButton.addTarget(self, action: #selector(testButtonTapped), for: .touchUpInside)
//        testButton2.addTarget(self, action: #selector(testButton2Tapped), for: .touchUpInside)
//        testButton3.addTarget(self, action: #selector(testButton3Tapped), for: .touchUpInside)
//    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//              self.navigationController?.setNavigationBarHidden(true, animated: animated) // <<
//    }
//    override func viewWillDisappear(_ animated: Bool) {
//         self.navigationController?.setNavigationBarHidden(false, animated: animated); // <<
//         super.viewWillDisappear(animated)
//    }
//    @objc private func testButtonTapped(){
//        let charachterVC = CharactersViewController()
//        navigationController?.pushViewController(charachterVC, animated: true)
//    }
//    @objc private func testButton2Tapped(){
//        let episodesVC = EpisodeViewController()
//        navigationController?.pushViewController(episodesVC, animated: true)
//    }
//    @objc private func testButton3Tapped(){
//        let locationVC = LocationViewController()
//        navigationController?.pushViewController(locationVC, animated: true)
//    }
//    private func setupButton(){
//        view.addSubview(testButton)
//        view.addSubview(testButton2)
//        view.addSubview(testButton3)
//        
//    }
//    private func setConstraints(){
//        NSLayoutConstraint.activate([testButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//                                     testButton2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//                                     testButton3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//                                     testButton.topAnchor.constraint(equalTo: view.topAnchor),
//                                     testButton2.topAnchor.constraint(equalTo: testButton.bottomAnchor),
//                                     testButton3.topAnchor.constraint(equalTo: testButton2.bottomAnchor),
//                                     testButton.heightAnchor.constraint(equalToConstant: 50),
//                                     testButton2.heightAnchor.constraint(equalToConstant: 50),
//                                     testButton3.heightAnchor.constraint(equalToConstant: 50),
//                                     testButton.widthAnchor.constraint(equalToConstant: 150),
//                                     testButton2.widthAnchor.constraint(equalToConstant: 150),
//                                     testButton3.widthAnchor.constraint(equalToConstant: 150)
//    private func setupButton(){
//        view.addSubview(testButton)
//
//    }
//    private func setConstraints(){
//        NSLayoutConstraint.activate([testButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//                                     testButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//                                     testButton.heightAnchor.constraint(equalToConstant: 50),
//                                     testButton.widthAnchor.constraint(equalToConstant: 150)
//        ])
//    }
//}
