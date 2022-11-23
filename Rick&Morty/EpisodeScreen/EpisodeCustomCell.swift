//
//  EpisodeCustomCell.swift
//  Rick&Morty
//
//  Created by Katy on 17.11.2022.
//  Copyright © 2022 Katya. All rights reserved.
//

//import UIKit
//
//class EpisodeCustomCell: UICollectionViewCell {
//
//
//    override init(frame: CGRect){
//        super.init(frame: frame)
//
//        addSubview(imageView)
//        imageView.frame=bounds
//        layer.cornerRadius = frame.height / 2.0
//
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    let imageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage()
//        imageView.contentMode = .scaleAspectFill
//        return imageView
//     }()
//
//}

import Foundation
import UIKit

class EpisodeCustomCell:UICollectionViewCell {
    static let reuseId="EpisodeId"
    private let photoImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .green
        imageView.contentMode = .scaleToFill
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor(white: 1, alpha: 0.7)
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        label.text = "Episode"
        imageView.addSubview(label)
        label.widthAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1).isActive = true
        label.textAlignment = .center
        label.bottomAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        
        return imageView
    }()
    var photoImage: UIImage?{
        photoImageView.image = #imageLiteral(resourceName: "default")
        photoImageView.layer.cornerRadius = 6
        photoImageView.clipsToBounds = true
        return photoImageView.image
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImageView()
    }
    private func setupImageView(){
        addSubview(photoImageView)
        photoImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        photoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        photoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        photoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

