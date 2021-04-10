//
//  UserFollowTableViewCell.swift
//  instagram
//
//  Created by Irvan Mahardhika on 10/04/21.
//

import UIKit

// added
protocol UserFollowTableViewCellDelegate:AnyObject {
    func didTapFollowUnfollowButton(model:UserRelationship)
}

enum FollowState {
    case following, not_following
}

struct UserRelationship {
    let username:String
    let name:String
    let type:FollowState
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
    
    private var model: UserRelationship?
    
    private let profileImageView:UIImageView = {
        let profileImageView = UIImageView()
        
        profileImageView.contentMode = .scaleAspectFill
        
        // this 1 line below is to enable "profileImageView.layer.cornerRadius = profileImageView.height/2"
        // in the layoutSubviews() below
        profileImageView.layer.masksToBounds = true
        
        profileImageView.backgroundColor = .secondarySystemBackground
        
        return profileImageView
    }()
    
    private let nameLabel:UILabel = {
        let nameLabel = UILabel()
        nameLabel.textColor = .label
        nameLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        nameLabel.numberOfLines = 1
        nameLabel.text = "nameLabel"
        return nameLabel
    }()
    
    private let usernameLabel:UILabel = {
        let usernameLabel = UILabel()
        usernameLabel.textColor = .label
        usernameLabel.font = .systemFont(ofSize: 17, weight: .regular)
        usernameLabel.numberOfLines = 1
        usernameLabel.text = "usernameLabel"
        usernameLabel.textColor = .secondaryLabel
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
        
        // this is like touchableWithoutFeedback
        selectionStyle = .none
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
        profileImageView.frame = CGRect(
            x: 3,
            y: 3,
            width: contentView.height-6,
            height: contentView.height-6
        )
        profileImageView.layer.cornerRadius = profileImageView.height/2
        
        let buttonWidth = contentView.width > 500 ? 220 : contentView.width/3
        followButton.frame = CGRect(
            x: contentView.width-5-buttonWidth,
            y: (contentView.height-40)/2,
            width: buttonWidth,
            height: 40
        )
        
        let labelHeight = contentView.height/2
        nameLabel.frame = CGRect(
            x: profileImageView.right+5,
            y: 0,
            width: contentView.width-profileImageView.width-8-buttonWidth,
            height: labelHeight
        )
        
        usernameLabel.frame = CGRect(
            x: profileImageView.right+5,
            y: nameLabel.bottom,
            width: contentView.width-profileImageView.width-8-buttonWidth,
            height: labelHeight
        )
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
    
    public func configure(with model:UserRelationship) {
        self.model = model
        nameLabel.text = model.name
        usernameLabel.text = model.username
        switch model.type {
        case .following:
            followButton.setTitle("unfollow", for: .normal)
            followButton.setTitleColor(.label, for: .normal)
            followButton.backgroundColor = .systemBackground
            followButton.layer.borderWidth = 1
            followButton.layer.borderColor = UIColor.label.cgColor
        case .not_following:
            followButton.setTitle("follow", for: .normal)
            followButton.setTitleColor(.white, for: .normal)
            followButton.backgroundColor = .link
            followButton.layer.borderWidth = 0
            
        }
    }
    
    @objc private func didTapFollowButton() {
        guard let model = model else { return }
        delegate?.didTapFollowUnfollowButton(model: model)
    }
    //

}
