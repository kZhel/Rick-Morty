//
//  ContentView.swift
//  Rick&Morty
//
//  Created by Katya on 07.11.2022.
//  Copyright © 2022 Katya. All rights reserved.
//

import UIKit

class MainViewController: UIViewController{
    private let testButton: UIButton = {
        let button = UIButton()
        button.setTitle("Characters", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let testButton2: UIButton = {
        let button = UIButton()
        button.setTitle("Episodes", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let testButton3: UIButton = {
        let button = UIButton()
        button.setTitle("Locations", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setupButton()
        setConstraints()
        testButton.addTarget(self, action: #selector(testButtonTapped), for: .touchUpInside)
        testButton2.addTarget(self, action: #selector(testButton2Tapped), for: .touchUpInside)
        testButton3.addTarget(self, action: #selector(testButton3Tapped), for: .touchUpInside)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
              self.navigationController?.setNavigationBarHidden(true, animated: animated) // <<
    }
    override func viewWillDisappear(_ animated: Bool) {
         self.navigationController?.setNavigationBarHidden(false, animated: animated); // <<
         super.viewWillDisappear(animated)
    }
    
    @objc private func testButtonTapped(){
        let charachterVC = CharactersViewController()
        navigationController?.pushViewController(charachterVC, animated: true)
    }
    @objc private func testButton2Tapped(){
        let episodesVC = EpisodeViewController()
        navigationController?.pushViewController(episodesVC, animated: true)
    }
    @objc private func testButton3Tapped(){
        let locationVC = LocationViewController()
        navigationController?.pushViewController(locationVC, animated: true)
    }
    private func setupButton(){
        view.addSubview(testButton)
        view.addSubview(testButton2)
        view.addSubview(testButton3)
        
    }
    private func setConstraints(){
        NSLayoutConstraint.activate([testButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     testButton2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     testButton3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     testButton.topAnchor.constraint(equalTo: view.topAnchor),
                                     testButton2.topAnchor.constraint(equalTo: testButton.bottomAnchor),
                                     testButton3.topAnchor.constraint(equalTo: testButton2.bottomAnchor),
                                     testButton.heightAnchor.constraint(equalToConstant: 50),
                                     testButton2.heightAnchor.constraint(equalToConstant: 50),
                                     testButton3.heightAnchor.constraint(equalToConstant: 50),
                                     testButton.widthAnchor.constraint(equalToConstant: 150),
                                     testButton2.widthAnchor.constraint(equalToConstant: 150),
                                     testButton3.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
}
