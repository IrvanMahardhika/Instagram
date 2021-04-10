//
//  ProfileTabCollectionReusableView.swift
//  instagram
//
//  Created by Irvan Mahardhika on 05/04/21.
//

import UIKit

// added
protocol ProfileTabCollectionReusableViewDelegate:AnyObject {
    func profileTabDidTapGridButton(_ tab:ProfileTabCollectionReusableView)
    func profileTabDidTapTaggedButton(_ tab:ProfileTabCollectionReusableView)
}
//


// "final" below is added
final class ProfileTabCollectionReusableView: UICollectionReusableView {
    
    // added
    static let identifier = "ProfileTabCollectionReusableView"
    
    // add this after creating "protocol ProfileTabCollectionReusableViewDelegate" above
    public weak var delegate:ProfileTabCollectionReusableViewDelegate?
    
    struct Constants {
        static let padding:CGFloat = 8
    }
    
    private let gridButton:UIButton = {
        let gridButton = UIButton()
        gridButton.clipsToBounds = true
        gridButton.tintColor = .systemBlue
        gridButton.setBackgroundImage(UIImage(systemName: "square.grid.2x2"), for: .normal)
        return gridButton
    }()
    
    private let taggedButton:UIButton = {
        let taggedButton = UIButton()
        taggedButton.clipsToBounds = true
        taggedButton.tintColor = .lightGray
        taggedButton.setBackgroundImage(UIImage(systemName: "tag"), for: .normal)
        return taggedButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubviews()
        addButtonActions()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(gridButton)
        addSubview(taggedButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let size = height-(Constants.padding*2)
        let gridButtonX = ((width/2)-size)/2
        gridButton.frame = CGRect(
            x: gridButtonX,
            y: Constants.padding,
            width: size,
            height: size
        )
        taggedButton.frame = CGRect(
            x: gridButtonX+(width/2),
            y: Constants.padding,
            width: size,
            height: size
        )
    }
    
    private func addButtonActions() {
        gridButton.addTarget(self, action: #selector(didTapGridButton), for: .touchUpInside)
        taggedButton.addTarget(self, action: #selector(didTapTaggedButton), for: .touchUpInside)
    }
    
    @objc private func didTapGridButton() {
        gridButton.tintColor = .systemBlue
        taggedButton.tintColor = .lightGray
        delegate?.profileTabDidTapGridButton(self)
    }
    
    @objc private func didTapTaggedButton() {
        gridButton.tintColor = .lightGray
        taggedButton.tintColor = .systemBlue
        delegate?.profileTabDidTapTaggedButton(self)
    }
    //
        
}
