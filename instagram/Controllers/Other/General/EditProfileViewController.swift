//
//  EditProfileViewController.swift
//  instagram
//
//  Created by Irvan Mahardhika on 01/04/21.
//

import UIKit

// added
struct EditProfileFormModel {
    let label:String
    let placeholder:String
    var value:String?
}
//

// "final" below is added
final class EditProfileViewController: UIViewController, UITableViewDataSource, FormTableViewCellDelegate {
    // added
    private let tableView:UITableView = {
        let tableView = UITableView()
        tableView.register(FormTableViewCell.self, forCellReuseIdentifier: FormTableViewCell.identifier)
        return tableView
    }()
    
    private var models = [[EditProfileFormModel]]()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: FormTableViewCell.identifier, for: indexPath) as! FormTableViewCell
        cell.configure(model: model)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard section == 1 else {
            return nil
        }
        return "Private Information"
    }
    
    func formTableViewCell(_ cell: FormTableViewCell, didUpdateField updatedModel: EditProfileFormModel?) {
        print(updatedModel?.value ?? "nill")
    }
    
    // cancel using footer
//    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        guard section == 1 else {
//            return nil
//        }
//        return "Private Information"
//    }
    //

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // added
        configureModels()
        tableView.tableHeaderView = createTableHeaderView()
        tableView.dataSource = self
        view.addSubview(tableView)
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel ", style: .plain, target: self, action: #selector(didTapCancel))
        //
    }
    
    // added
    override func viewDidLayoutSubviews() {
        super .viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
    }
    
    private func configureModels() {
        let section1Labels = ["Name", "Username", "Bio"]
        var section1 = [EditProfileFormModel]()
        for label in section1Labels {
            let model = EditProfileFormModel(label: label, placeholder: "Enter \(label)...", value: nil)
            section1.append(model)
        }
        models.append(section1)
        
        let section2Labels = ["Email", "Phone", "Gender"]
        var section2 = [EditProfileFormModel]()
        for label in section2Labels {
            let model = EditProfileFormModel(label: label, placeholder: "Enter \(label)...", value: nil)
            section2.append(model)
        }
        models.append(section2)
        
    }
    
    private func createTableHeaderView() -> UIView {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: view.height / 4).integral)
        let size = header.height / 1.5
        let profilePhotoButton = UIButton(
            frame: CGRect(
                x: (view.width - size) / 2,
                y: (header.height - size) / 2,
                width: size,
                height: size
            )
        )
        header.addSubview(profilePhotoButton)
        profilePhotoButton.layer.masksToBounds = true
        profilePhotoButton.layer.cornerRadius = size / 2.0
        profilePhotoButton.tintColor = .label
        profilePhotoButton.addTarget(self, action: #selector(didTapProfilePhotoButton), for: .touchUpInside)
        profilePhotoButton.setBackgroundImage(UIImage(systemName: "person.circle"), for: .normal)
        profilePhotoButton.layer.borderWidth = 1
        profilePhotoButton.layer.borderColor = UIColor.secondarySystemBackground.cgColor
        
        return header
    }
    
    @objc private func didTapProfilePhotoButton() {
        
    }
    
    @objc private func didTapSave() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func didTapCancel() {
        dismiss(animated: true, completion: nil)
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
