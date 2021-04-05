//
//  SettingsViewController.swift
//  instagram
//
//  Created by Irvan Mahardhika on 01/04/21.
//

import UIKit

// added
import SafariServices

struct SettingsCellModel {
    let title: String
    let handler: () -> Void
}
//


// "final" below is added
final class SettingsViewController: UIViewController {
    
    // added
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private var data = [[SettingsCellModel]]()

    //

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // added
        view.backgroundColor = .systemBackground
        addSubviews()
        configureModel()
        tableView.delegate = self
        tableView.dataSource = self
        //
    }
    
    // added
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
    private func configureModel() {
        data.append([
            SettingsCellModel(title: "Edit Profile") { [weak self] in
                self?.didTapEditProfile()
            },
            SettingsCellModel(title: "Invite Friends") { [weak self] in
                self?.didTapInviteFriends()
            },
            SettingsCellModel(title: "Save Original Posts") { [weak self] in
                self?.didTapInviteFriends()
            }
        ])
        
        data.append([
            SettingsCellModel(title: "Terms of Service") { [weak self] in
                self?.openUrl(type: .terms)
            },
            SettingsCellModel(title: "Privacy Policy") { [weak self] in
                self?.openUrl(type: .privacy)
            },
            SettingsCellModel(title: "Help / Feedback") { [weak self] in
                self?.openUrl(type: .help)
            }
        ])
        
        data.append([
            SettingsCellModel(title: "Log Out") { [weak self] in
                self?.didTapLogOut()
            }
        ])
    }
    
    private func didTapEditProfile() {
        let editProfileVC = EditProfileViewController()
        editProfileVC.title = "Edit Profile"
        let navVC = UINavigationController(rootViewController: editProfileVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
        
    }
    
    private func didTapInviteFriends() {
        
    }
    
    private func didTapSaveOriginalPosts() {
        
    }
    
    enum SettingsURLType {
        case terms, privacy, help
    }
    
    private func openUrl(type: SettingsURLType) {
        let urlString:String
        switch type {
        case .terms:
            urlString = "https://help.instagram.com/1215086795543252"
        case .privacy:
            urlString = "https://help.instagram.com/519522125107875"
        case .help:
            urlString = "https://help.instagram.com"
        }
        guard let url = URL(string: urlString) else { return }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }
    
    private func didTapLogOut() {
        let actionSheet = UIAlertController(
            title: "Log Out",
            message: "Are you sure you want to log out?",
            preferredStyle: .actionSheet
        )
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { _ in
            AuthManager.shared.logOut { (success) in
                DispatchQueue.main.async {
                    if success {
                        let loginVC = LoginViewController()
                        loginVC.modalPresentationStyle = .fullScreen
                        self.present(loginVC, animated: true) {
                            self.navigationController?.popToRootViewController(animated: false)
                            self.tabBarController?.selectedIndex = 0
                        }
                    }
                    else {
                        fatalError("Could not log out user")
                    }
                }
            }
        }))
        // these 2 lines is to enable action sheet to present on iPad
        // without these 2 lines, action sheet wont know how to present it self on ipad
        actionSheet.popoverPresentationController?.sourceView = tableView
        actionSheet.popoverPresentationController?.sourceRect = tableView.bounds
        
        present(actionSheet, animated: true)
        
    }
    //
}

// added
extension SettingsViewController:UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        data[indexPath.section][indexPath.row].handler()
    }
}
//
