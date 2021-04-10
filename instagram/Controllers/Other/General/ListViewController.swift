//
//  ListViewController.swift
//  instagram
//
//  Created by Irvan Mahardhika on 01/04/21.
//

import UIKit

class ListViewController: UIViewController {
    
    // added
    private let data:[String]
    
    private let tableView:UITableView = {
        let tableView = UITableView()
        tableView.register(UserFollowTableViewCell.self, forCellReuseIdentifier: UserFollowTableViewCell.identifier)
        return tableView
    }()
    
    init(data: [String]) {
        // these 2 lines below will get error if the sequence is swapped
        self.data = data
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // added
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        //
    }
    
    // added
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    //

}

// added
extension ListViewController:UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: UserFollowTableViewCell.identifier,
            for: indexPath) as! UserFollowTableViewCell
        cell.configure(with: "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let model = data[indexPath.row]
    }
    
    
}
//
