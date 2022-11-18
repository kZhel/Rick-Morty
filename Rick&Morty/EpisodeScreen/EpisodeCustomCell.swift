//
//  EpisodeCustomCell.swift
//  Rick&Morty
//
//  Created by Katy on 17.11.2022.
//  Copyright © 2022 Katya. All rights reserved.
//

import UIKit

class EpisodeCustomCell: UICollectionViewCell {

    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        addSubview(imageView)
        imageView.frame=bounds
        layer.cornerRadius = frame.height / 2.0
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage()
        imageView.contentMode = .scaleAspectFill
        return imageView
     }()

}
