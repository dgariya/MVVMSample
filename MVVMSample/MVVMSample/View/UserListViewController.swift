//
//  ViewController.swift
//  MVVMSample
//
//  Created by Singh, Dev on 2020/02/03.
//  Copyright © 2020 Singh, Dev. All rights reserved.
//

import UIKit

class UserListViewController: UITableViewController {
    
    private var userListViewModel: UserListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = Constants.Titles.userListTitle
        fetchUserList()
    }
    
    func fetchUserList() {
        NetworkClient().request(endPoint: .fetch(path: Constants.Path.userList, queryItems: nil)) { (result: Result<[User]>) in
            switch result {
            case .success(let userList):
                self.userListViewModel = UserListViewModel(users: userList)
                 DispatchQueue.main.async {
                     self.tableView.reloadData()
                 }
            case .failure(let error):
                print("Error:\(error.description)")
            }
        }
    }
    
    // MARK: - Table View
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.userListViewModel == nil ? 0 : self.userListViewModel.numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userListViewModel == nil ? 0 : userListViewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
         let userViewModel = self.userListViewModel.userAtIndex(indexPath.row)
        cell.textLabel?.text = userViewModel.name
        cell.detailTextLabel?.text = userViewModel.email
        return cell
    }
    
}


