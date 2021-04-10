//
//  UserFollowTableViewCell.swift
//  instagram
//
//  Created by Irvan Mahardhika on 10/04/21.
//

import UIKit

// added
protocol UserFollowTableViewCellDelegate:AnyObject {
    func didTapFollowUnfollowButton(model:String)
}
//

class UserFollowTableViewCell: UITableViewCell {
    

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
    static let identifier = "UserFollowTableViewCell"
    
    // add this after creating "protocol UserFollowTableViewCellDelegate" above
    public weak var delegate:UserFollowTableViewCellDelegate?
    
    private let profileImageView:UIImageView = {
        let profileImageView = UIImageView()
        
        profileImageView.contentMode = .scaleAspectFill
        
        // this 1 line below is to enable "profileImageView.layer.cornerRadius = profilePhotoSize/2"
        // in the layoutSubviews() below
        profileImageView.layer.masksToBounds = true
        
        return profileImageView
    }()
    
    private let nameLabel:UILabel = {
        let nameLabel = UILabel()
        nameLabel.textColor = .label
        nameLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        nameLabel.numberOfLines = 1
        return nameLabel
    }()
    
    private let usernameLabel:UILabel = {
        let usernameLabel = UILabel()
        usernameLabel.textColor = .label
        usernameLabel.font = .systemFont(ofSize: 17, weight: .regular)
        usernameLabel.numberOfLines = 1
        return usernameLabel
    }()
    
    private let followButton:UIButton = {
        let followButton = UIButton()
        return followButton
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        addSubviews()
        followButton.addTarget(self, action: #selector(didTapFollowButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(profileImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(followButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        profileImageView.image = nil
        nameLabel.text = nil
        usernameLabel.text = nil
        followButton.setTitle(nil, for: .normal)
        followButton.layer.borderWidth = 0
        followButton.backgroundColor = nil
    }
    
    public func configure(with model:String) {
        
    }
    
    @objc private func didTapFollowButton() {
        
    }
    //

}
