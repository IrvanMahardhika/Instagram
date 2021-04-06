//
//  PhotoCollectionViewCell.swift
//  instagram
//
//  Created by Irvan Mahardhika on 05/04/21.
//

import UIKit

// added
import SDWebImage
//

class PhotoCollectionViewCell: UICollectionViewCell {
    
    // added
    static let identifier = "PhotoCollectionViewCell"
    
    private let photoImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        photoImageView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(photoImageView)
        contentView.clipsToBounds = true
        accessibilityLabel = "User post image"
        accessibilityHint = "Double-tap to open post"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with model:UserPost) {
        let thumbnailURL = model.thumbnailImage
        // we are not gonna do this
//        let task = URLSession.shared.dataTask(with: thumbnailURL) { (data, _, _) in
//            self.photoImageView.image = UIImage(data: data!)
//        }
        photoImageView.sd_setImage(with: thumbnailURL, completed: nil)
    }
    
    public func configure(debug imageName:String) {
        photoImageView.image = UIImage(named: imageName)
        
    }
    //
    
}
