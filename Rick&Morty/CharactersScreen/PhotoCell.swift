//
//  PhotoCell.swift
//  Rick&Morty
//
//  Created by Katya on 22.11.2022.
//  Copyright © 2022 Katya. All rights reserved.
//

import Foundation
import UIKit

class PhotoCell:UICollectionViewCell {
    static let reuseId="PhotoCell"
    private let photoImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .green
        imageView.contentMode = .scaleToFill
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor(white: 1, alpha: 0.7)
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .black
        label.text = "Morty"
        imageView.addSubview(label)
        label.widthAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant: 60).isActive = true
        label.textAlignment = .center
        label.bottomAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        
        return imageView
    }()
    var photoImage: UIImage?{
        photoImageView.image = #imageLiteral(resourceName: "tumblr_n45cr8dmj61ty0km0o7_1280")
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
