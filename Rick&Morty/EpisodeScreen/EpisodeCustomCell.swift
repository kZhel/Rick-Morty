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
        
        var labelName = UILabel()
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.backgroundColor = UIColor(white: 1, alpha: 0.4)
        labelName.font = UIFont.boldSystemFont(ofSize: 17)
        labelName.textColor = .white
        labelName.lineBreakMode = NSLineBreakMode.byWordWrapping
        labelName.numberOfLines = 3
        labelName.text = "Rixty Minutes"
        imageView.addSubview(labelName)
        labelName.widthAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        labelName.heightAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1.6).isActive = true
        labelName.textAlignment = .center
        labelName.bottomAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        
        var labelNumS = UILabel()
        labelNumS.translatesAutoresizingMaskIntoConstraints = false
        labelNumS.backgroundColor = UIColor(white: 1, alpha: 0)
        labelNumS.font = UIFont.systemFont(ofSize: 9)
        labelNumS.textColor = .white
        labelNumS.text="Number"
        imageView.addSubview(labelNumS)
        labelNumS.widthAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        labelNumS.heightAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1.6).isActive = true
        labelNumS.textAlignment = .center
        labelNumS.bottomAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 25).isActive = true
        
        var labelNumB = UILabel()
        labelNumB.translatesAutoresizingMaskIntoConstraints = false
        labelNumB.backgroundColor = UIColor(white: 1, alpha: 0)
        labelNumB.font = UIFont.boldSystemFont(ofSize: 17)
        labelNumB.textColor = .white
        labelNumB.lineBreakMode = NSLineBreakMode.byWordWrapping
        labelNumB.numberOfLines = 3
        labelNumB.text = "S01E10"
        imageView.addSubview(labelNumB)
        labelNumB.widthAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        labelNumB.heightAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1.6).isActive = true
        labelNumB.textAlignment = .center
        labelNumB.bottomAnchor.constraint(equalTo: labelNumS.bottomAnchor, constant: 25).isActive = true
        
        var labelDateS = UILabel()
        labelDateS.translatesAutoresizingMaskIntoConstraints = false
        labelDateS.backgroundColor = UIColor(white: 1, alpha: 0)
        labelDateS.font = UIFont.systemFont(ofSize: 9)
        labelDateS.textColor = .white
        labelDateS.text="Date"
        imageView.addSubview(labelDateS)
        labelDateS.widthAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        labelDateS.heightAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1.6).isActive = true
        labelDateS.textAlignment = .center
        labelDateS.bottomAnchor.constraint(equalTo: labelNumB.bottomAnchor, constant: 25).isActive = true
        
        
        var labelDateB = UILabel()
        labelDateB.translatesAutoresizingMaskIntoConstraints = false
        labelDateB.backgroundColor = UIColor(white: 1, alpha: 0)
        labelDateB.font = UIFont.boldSystemFont(ofSize: 17)
        labelDateB.textColor = .white
        labelDateB.lineBreakMode = NSLineBreakMode.byWordWrapping
        labelDateB.numberOfLines = 3
        labelDateB.text = "April, 2014"
        imageView.addSubview(labelDateB)
        labelDateB.widthAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        labelDateB.heightAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1.6).isActive = true
        labelDateB.textAlignment = .center
        labelDateB.bottomAnchor.constraint(equalTo: labelDateS.bottomAnchor, constant: 25).isActive = true
       
        
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

