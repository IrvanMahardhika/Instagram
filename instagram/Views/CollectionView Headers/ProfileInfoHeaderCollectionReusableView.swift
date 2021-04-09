//
//  ProfileInfoHeaderCollectionReusableView.swift
//  instagram
//
//  Created by Irvan Mahardhika on 05/04/21.
//

import UIKit

// added
protocol ProfileInfoHeaderCollectionReusableViewDelegate:AnyObject {
    func profileHeaderDidTapPostsButton(_ header:ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapFollowingButton(_ header:ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapFollowersButton(_ header:ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapEditProfileButton(_ header:ProfileInfoHeaderCollectionReusableView)
}
//

// "final" below is added
final class ProfileInfoHeaderCollectionReusableView: UICollectionReusableView {
        
    // added
    static let identifier = "ProfileInfoHeaderCollectionReusableView"
    
    // add this after creating "protocol ProfileInfoHeaderCollectionReusableViewDelegate" above
    public weak var delegate:ProfileInfoHeaderCollectionReusableViewDelegate?
    
    private let profilePhotoImageView:UIImageView = {
        let profilePhotoImageView = UIImageView()
        profilePhotoImageView.backgroundColor = .red
        
        // this 1 line below is to enable "profilePhotoImageView.layer.cornerRadius = profilePhotoSize/2"
        // in the layoutSubviews() below
        profilePhotoImageView.layer.masksToBounds = true
        
        return profilePhotoImageView
    }()
    
    private let postsButton:UIButton = {
        let postsButton = UIButton()
        postsButton.setTitle("Posts", for: .normal)
        postsButton.setTitleColor(.label, for: .normal)
        return postsButton
    }()
    
    private let followingButton:UIButton = {
        let followingButton = UIButton()
        followingButton.setTitle("Following", for: .normal)
        followingButton.setTitleColor(.label, for: .normal)
        return followingButton
    }()
    
    private let followersButton:UIButton = {
        let followersButton = UIButton()
        followersButton.setTitle("Followers", for: .normal)
        followersButton.setTitleColor(.label, for: .normal)
        return followersButton
    }()
    
    private let editProfileButton:UIButton = {
        let editProfileButton = UIButton()
        editProfileButton.setTitle("Edit Your Profile", for: .normal)
        editProfileButton.setTitleColor(.label, for: .normal)
        return editProfileButton
    }()
    
    private let nameLabel:UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Irvan Mahardhika"
        nameLabel.textColor = .label
        nameLabel.numberOfLines = 1
        return nameLabel
    }()
    
    private let bioLabel:UILabel = {
        let bioLabel = UILabel()
        bioLabel.text = "This is first account"
        bioLabel.textColor = .label
        bioLabel.numberOfLines = 0 // line wrap
        return bioLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        clipsToBounds = true
        addSubViews()
        addButtonActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let profilePhotoSize = width/4
        profilePhotoImageView.frame = CGRect(
            x: 5,
            y: 5,
            width: profilePhotoSize,
            height: profilePhotoSize
        ).integral
        
        // to enable this cornerRadius
        // add "profilePhotoImageView.layer.masksToBounds = true"
        // in the profilePhotoImageView definition above
        profilePhotoImageView.layer.cornerRadius = profilePhotoSize/2
        
        let buttonHeight = profilePhotoSize/2
        let countButtonWidth = width-10-profilePhotoSize
        
        postsButton.frame = CGRect(
            x: profilePhotoImageView.right,
            y: 5, width: countButtonWidth/3,
            height: buttonHeight
        ).integral
        
        followingButton.frame = CGRect(
            x: postsButton.right,
            y: 5,
            width: countButtonWidth/3,
            height: buttonHeight
        ).integral
        
        followersButton.frame = CGRect(
            x: followingButton.right,
            y: 5,
            width: countButtonWidth/3,
            height: buttonHeight
        ).integral
        
        editProfileButton.frame = CGRect(
            x: profilePhotoImageView.right,
            y: buttonHeight+5,
            width: countButtonWidth,
            height: buttonHeight
        ).integral
        
        nameLabel.frame = CGRect(
            x: 5,
            y: profilePhotoImageView.bottom+5,
            width: width-10 ,
            height: 50
        ).integral
        
        // set label width based on the text inside the label
        let bioLabelSize = bioLabel.sizeThatFits(frame.size)
        
        bioLabel.frame = CGRect(
            x: 5,
            y: nameLabel.bottom+5,
            width: width-10 ,
            height: bioLabelSize.height
        ).integral
    }
    
    private func addSubViews() {
        addSubview(profilePhotoImageView)
        addSubview(postsButton)
        addSubview(followingButton)
        addSubview(followersButton)
        addSubview(editProfileButton)
        addSubview(nameLabel)
        addSubview(bioLabel)
    }
    
    private func addButtonActions() {
        postsButton.addTarget(self, action: #selector(didTapPostsButton), for: .touchUpInside)
        followingButton.addTarget(self, action: #selector(didTapFollowingButton), for: .touchUpInside)
        followersButton.addTarget(self, action: #selector(didTapFollowersButton), for: .touchUpInside)
        editProfileButton.addTarget(self, action: #selector(didTapEditProfileButton), for: .touchUpInside)
        
    }
    
    @objc private func didTapPostsButton() {
        delegate?.profileHeaderDidTapPostsButton(self)
    }
    @objc private func didTapFollowingButton() {
        delegate?.profileHeaderDidTapFollowingButton(self)
    }
    @objc private func didTapFollowersButton() {
        delegate?.profileHeaderDidTapFollowersButton(self)
    }
    @objc private func didTapEditProfileButton() {
        delegate?.profileHeaderDidTapEditProfileButton(self)
    }
    //
}
