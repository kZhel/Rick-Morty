
import Foundation
import UIKit

class PhotoCell:UICollectionViewCell {
    static let reuseId="PhotoCell"
    let label = UILabel()
    private let photoImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .green
        imageView.contentMode = .scaleToFill
        
        
        return imageView
    }()
    func photoImage(text: String, imageURL: String){
        print(imageURL)
        guard let url = URL(string: imageURL) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url){[weak self] data,_,error in
            guard let data = data, error == nil else{
                return
            }
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self?.photoImageView.image = image
            }
        }
        task.resume()
        //photoImageView.image = #imageLiteral(resourceName: "tumblr_n45cr8dmj61ty0km0o7_1280")
        photoImageView.layer.cornerRadius = 6
        photoImageView.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor(white: 1, alpha: 0.7)
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .black
        label.text = text
        photoImageView.addSubview(label)
        label.widthAnchor.constraint(equalTo: photoImageView.widthAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: photoImageView.heightAnchor, multiplier: 0.35).isActive = true
        label.textAlignment = .center
        label.bottomAnchor.constraint(equalTo: photoImageView.bottomAnchor).isActive = true
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
        label.removeFromSuperview()
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
