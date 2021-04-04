//
//  EditProfileViewController.swift
//  instagram
//
//  Created by Irvan Mahardhika on 01/04/21.
//

import UIKit

class EditProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // added
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel ", style: .plain, target: self, action: #selector(didTapCancel))
        //
    }
    
    // added
    @objc private func didTapSave() {
        
    }
    
    @objc private func didTapCancel() {
        
    }
    
    @objc private func didTapChangeProfilePicture() {
        let actionSheet = UIAlertController(title: "Profile Picture", message: "Change profile picture", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { (_) in
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Choose From Library", style: .default, handler: { (_) in
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        
        // these 2 lines is to enable action sheet to present on iPad
        // without these 2 lines, action sheet wont know how to present it self on ipad
        actionSheet.popoverPresentationController?.sourceView = view
        actionSheet.popoverPresentationController?.sourceRect = view.bounds
        
        present(actionSheet, animated: true)
        
    }
    //

}
