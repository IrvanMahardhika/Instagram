//
//  ProfileTabCollectionReusableView.swift
//  instagram
//
//  Created by Irvan Mahardhika on 05/04/21.
//

import UIKit

class ProfileTabCollectionReusableView: UICollectionReusableView {
    
    // added
    static let identifier = "ProfileTabCollectionReusableView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //
        
}
