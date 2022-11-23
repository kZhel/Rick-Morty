//
//  MainScreenButton.swift
//  Rick&Morty
//
//  Created by Katya on 07.11.2022.
//  Copyright © 2022 Katya. All rights reserved.
//


import UIKit

protocol MainScreenButtonDelegate: AnyObject {

    func didTapMainScreenButton(with type: MainScreenButtonType)
}

final class MainScreenButton: UIButton {

    // Private
    private let models: [MainScreenModel] = [
        MainScreenModel(imageName: "rick-and-morty-lede", buttonType: .characters),
        MainScreenModel(imageName: "rick-and-morty-screaming-sun", buttonType: .locations),
        MainScreenModel(imageName: "episodes", buttonType: .episodes)
    ]
    
    // Dependencies
    var type: MainScreenButtonType
    weak var delegate: MainScreenButtonDelegate?

    // MARK: - Init

    init(with type: MainScreenButtonType) {
        self.type = type
        super.init(frame: .zero)

        self.setUpButton(type: type)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private functions

private extension MainScreenButton {

    func setUpButton(type: MainScreenButtonType) {
        var backgroundImage: UIImage?
        
    
        models.forEach {
            if $0.buttonType == type {
                backgroundImage = UIImage(named: $0.imageName)
            }
        }
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        self.layer.cornerRadius = 200
        setBackgroundImage(backgroundImage, for: .normal)
    }
    
    @objc func buttonTapped() {
        delegate?.didTapMainScreenButton(with: type)
        
    }
}
