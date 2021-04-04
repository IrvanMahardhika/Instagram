//
//  ViewController.swift
//  instagram
//
//  Created by Irvan Mahardhika on 01/04/21.
//

// added
import FirebaseAuth
//

import UIKit

class HomeViewController: UIViewController {
    
    // added
    private let tableView:UITableView = {
        let tableView = UITableView()
        tableView.register(IGFeedPostTableViewCell.self, forCellReuseIdentifier: IGFeedPostTableViewCell.identifier)
        return tableView
    }()
    //

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // added
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        //
    }

    // added
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        handleNotAuthenticated()
    }
    
    private func handleNotAuthenticated() {
        // check auth status
        if Auth.auth().currentUser == nil {
            // show log in
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false)
        }
    }
    
    //

}

// added
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IGFeedPostTableViewCell.identifier, for: indexPath) as! IGFeedPostTableViewCell
        return cell
    }
    
    
}
//
