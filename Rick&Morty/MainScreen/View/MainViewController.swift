//
//  ContentView.swift
//  Rick&Morty
//
//  Created by Katya on 07.11.2022.
//  Copyright © 2022 Katya. All rights reserved.
//

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
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .yellow
//        setupButton()
//        setConstraints()
//        testButton.addTarget(self, action: #selector(testButtonTapped), for: .touchUpInside)
//    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//              self.navigationController?.setNavigationBarHidden(true, animated: animated) // <<
//    }
//    override func viewWillDisappear(_ animated: Bool) {
//         self.navigationController?.setNavigationBarHidden(false, animated: animated); // <<
//         super.viewWillDisappear(animated)
//    }
//    
//    @objc private func testButtonTapped(){
//        let charachterVC = CharactersViewController()
//        navigationController?.pushViewController(charachterVC, animated: true)
//    }
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
