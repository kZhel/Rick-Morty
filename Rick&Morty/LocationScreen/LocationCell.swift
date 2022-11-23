//
//  LocationCell.swift
//  Rick&Morty
//
//  Created by Katy on 23.11.2022.
//  Copyright © 2022 Katya. All rights reserved.
//

import Foundation
import UIKit

class LocationCell:UICollectionViewCell {
    static let reuseId="LocationId"
    private let photoImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .green
        imageView.contentMode = .scaleToFill
        
        var labelName = UILabel()
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.backgroundColor = UIColor(white: 1, alpha: 0.4)
        labelName.font = UIFont.boldSystemFont(ofSize: 17)
        labelName.textColor = .white
        labelName.lineBreakMode = NSLineBreakMode.byWordWrapping
        labelName.numberOfLines = 3
        labelName.text = "Earth (C-137)"
        imageView.addSubview(labelName)
        labelName.widthAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        labelName.heightAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 0.25).isActive = true
        labelName.textAlignment = .center
        labelName.topAnchor.constraint(equalTo: imageView.topAnchor).isActive = true
        
        var labelNumS = UILabel()
        labelNumS.translatesAutoresizingMaskIntoConstraints = false
        labelNumS.backgroundColor = UIColor(white: 1, alpha: 0.4)
        labelNumS.font = UIFont.systemFont(ofSize: 9)
        labelNumS.textColor = .white
        labelNumS.text="Type"
        imageView.addSubview(labelNumS)
        labelNumS.widthAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        labelNumS.heightAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 0.1).isActive = true
        labelNumS.textAlignment = .center
        labelNumS.topAnchor.constraint(equalTo: labelName.bottomAnchor).isActive = true
        
        var labelNumB = UILabel()
        labelNumB.translatesAutoresizingMaskIntoConstraints = false
        labelNumB.backgroundColor = UIColor(white: 1, alpha: 0.4)
        labelNumB.font = UIFont.boldSystemFont(ofSize: 17)
        labelNumB.textColor = .white
        labelNumB.lineBreakMode = NSLineBreakMode.byWordWrapping
        labelNumB.numberOfLines = 3
        labelNumB.text = "Planet"
        imageView.addSubview(labelNumB)
        labelNumB.widthAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        labelNumB.heightAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 0.25).isActive = true
        labelNumB.textAlignment = .center
        labelNumB.topAnchor.constraint(equalTo: labelNumS.bottomAnchor).isActive = true
        
        var labelDateS = UILabel()
        labelDateS.translatesAutoresizingMaskIntoConstraints = false
        labelDateS.backgroundColor = UIColor(white: 1, alpha: 0.4)
        labelDateS.font = UIFont.systemFont(ofSize: 9)
        labelDateS.textColor = .white
        labelDateS.text="Dimension"
        imageView.addSubview(labelDateS)
        labelDateS.widthAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        labelDateS.heightAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 0.1).isActive = true
        labelDateS.textAlignment = .center
        labelDateS.topAnchor.constraint(equalTo: labelNumB.bottomAnchor).isActive = true
        
        
        var labelDateB = UILabel()
        labelDateB.translatesAutoresizingMaskIntoConstraints = false
        labelDateB.backgroundColor = UIColor(white: 1, alpha: 0.4)
        labelDateB.font = UIFont.boldSystemFont(ofSize: 17)
        labelDateB.textColor = .white
        labelDateB.lineBreakMode = NSLineBreakMode.byWordWrapping
        labelDateB.numberOfLines = 3
        labelDateB.text = "Dimension C-137"
        imageView.addSubview(labelDateB)
        labelDateB.widthAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        labelDateB.heightAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 0.3).isActive = true
        labelDateB.textAlignment = .center
        labelDateB.bottomAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
       
        
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
