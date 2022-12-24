import Foundation
import UIKit

class EpisodeCustomCell:UICollectionViewCell {
    static let reuseId="EpisodeId"
     let labelName = UILabel()
    let labelNumS = UILabel()
    let labelNumB = UILabel()
    let labelDateS = UILabel()
    let labelDateB = UILabel()
    private let photoImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .green
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    func photoImage(name: String, episode: String, airDate: String) {
        photoImageView.image = #imageLiteral(resourceName: "default")
        photoImageView.layer.cornerRadius = 6
        photoImageView.clipsToBounds = true
        
         labelName.translatesAutoresizingMaskIntoConstraints = false
         labelName.backgroundColor = UIColor(white: 1, alpha: 0.4)
         labelName.font = UIFont.boldSystemFont(ofSize: 17)
         labelName.textColor = .white
         labelName.lineBreakMode = NSLineBreakMode.byWordWrapping
         labelName.numberOfLines = 3
         labelName.text = name
         photoImageView.addSubview(labelName)
         labelName.widthAnchor.constraint(equalTo: photoImageView.widthAnchor).isActive = true
         labelName.heightAnchor.constraint(equalTo: photoImageView.heightAnchor, multiplier: 0.3).isActive = true
         labelName.textAlignment = .center
         labelName.topAnchor.constraint(equalTo: photoImageView.topAnchor).isActive = true
         
         labelNumS.translatesAutoresizingMaskIntoConstraints = false
         labelNumS.backgroundColor = UIColor(white: 1, alpha: 0.4)
         labelNumS.font = UIFont.systemFont(ofSize: 9)
         labelNumS.textColor = .white
         labelNumS.text="Number"
         photoImageView.addSubview(labelNumS)
         labelNumS.widthAnchor.constraint(equalTo: photoImageView.widthAnchor).isActive = true
         labelNumS.heightAnchor.constraint(equalTo: photoImageView.heightAnchor, multiplier: 0.1).isActive = true
         labelNumS.textAlignment = .center
         labelNumS.topAnchor.constraint(equalTo: labelName.bottomAnchor).isActive = true
         
         labelNumB.translatesAutoresizingMaskIntoConstraints = false
         labelNumB.backgroundColor = UIColor(white: 1, alpha: 0.4)
         labelNumB.font = UIFont.boldSystemFont(ofSize: 17)
         labelNumB.textColor = .white
         labelNumB.lineBreakMode = NSLineBreakMode.byWordWrapping
         labelNumB.numberOfLines = 3
         labelNumB.text = episode
         photoImageView.addSubview(labelNumB)
         labelNumB.widthAnchor.constraint(equalTo: photoImageView.widthAnchor).isActive = true
         labelNumB.heightAnchor.constraint(equalTo: photoImageView.heightAnchor, multiplier: 0.25).isActive = true
         labelNumB.textAlignment = .center
         labelNumB.topAnchor.constraint(equalTo: labelNumS.bottomAnchor).isActive = true
         
         labelDateS.translatesAutoresizingMaskIntoConstraints = false
         labelDateS.backgroundColor = UIColor(white: 1, alpha: 0.4)
         labelDateS.font = UIFont.systemFont(ofSize: 9)
         labelDateS.textColor = .white
         labelDateS.text="Date"
         photoImageView.addSubview(labelDateS)
         labelDateS.widthAnchor.constraint(equalTo: photoImageView.widthAnchor).isActive = true
         labelDateS.heightAnchor.constraint(equalTo: photoImageView.heightAnchor, multiplier: 0.1).isActive = true
         labelDateS.textAlignment = .center
         labelDateS.topAnchor.constraint(equalTo: labelNumB.bottomAnchor).isActive = true
         
         labelDateB.translatesAutoresizingMaskIntoConstraints = false
         labelDateB.backgroundColor = UIColor(white: 1, alpha: 0.4)
         labelDateB.font = UIFont.boldSystemFont(ofSize: 17)
         labelDateB.textColor = .white
         labelDateB.lineBreakMode = NSLineBreakMode.byWordWrapping
         labelDateB.numberOfLines = 3
         labelDateB.text = airDate
         photoImageView.addSubview(labelDateB)
         labelDateB.widthAnchor.constraint(equalTo: photoImageView.widthAnchor).isActive = true
         labelDateB.heightAnchor.constraint(equalTo: photoImageView.heightAnchor, multiplier: 0.25).isActive = true
         labelDateB.textAlignment = .center
         labelDateB.bottomAnchor.constraint(equalTo: photoImageView.bottomAnchor).isActive = true
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
        labelName.removeFromSuperview()
        labelNumS.removeFromSuperview()
        labelNumB.removeFromSuperview()
        labelDateS.removeFromSuperview()
        labelDateB.removeFromSuperview()
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

