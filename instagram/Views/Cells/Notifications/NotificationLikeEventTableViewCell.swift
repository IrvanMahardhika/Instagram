//
//  NotificationLikeEventTableViewCell.swift
//  instagram
//
//  Created by Irvan Mahardhika on 11/04/21.
//

import UIKit

// added
protocol NotificationLikeEventTableViewCellDelegate: AnyObject {
    func didTapRelatedPostButton(model:String)
}
//

class NotificationLikeEventTableViewCell: UITableViewCell {

    // origin
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    //
    
    // added
    static let identifier = "NotificationLikeEventTableViewCell"
    
    public weak var delegate:NotificationLikeEventTableViewCellDelegate?
    
    private let profileImageView:UIImageView = {
        let profileImageView = UIImageView()
        profileImageView.layer.masksToBounds = true
        profileImageView.contentMode = .scaleAspectFill
        return profileImageView
    }()
    
    private let label:UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()
    
    private let postButton:UIButton = {
        let postButton = UIButton()
        return postButton
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        contentView.addSubview(profileImageView)
        contentView.addSubview(label)
        contentView.addSubview(postButton)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        postButton.setBackgroundImage(nil, for: .normal)
        label.text = nil
        profileImageView.image = nil
        
    }
    
    public func configure() {
        
    }
    //
}
