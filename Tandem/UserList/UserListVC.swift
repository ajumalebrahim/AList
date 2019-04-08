//
//  UserListVC.swift
//  Tandem
//
//  Created by Ajumal Ebrahim on 4/8/19.
//  Copyright © 2019 Ajumal Ebrahim. All rights reserved.
//

import UIKit

class UserListVC: UIViewController {
    
    // MARK: - OutLets
    @IBOutlet private weak var tblVwUserList: UITableView!
    
    // MARK: -
    var vm = UserListVM()
    private var userList: User?
    // MARK: - View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
        vm.callUserListAPI()
    }
    
    // MARK: - Private methods
    private func setupView() {
        self.vm.delegate = self
        self.tblVwUserList.dataSource = self
        self.tblVwUserList.register(UserListCell.nib, forCellReuseIdentifier: UserListCell.identifier)
    }

}

 // MARK: - extension
extension UserListVC: UserListVMDelegate {
    
    func willCallUserListAPI() {
        // show loading
    }
    
    func didSuccesUserListAPI(users: User) {
        // hide loading
        
        userList = users
        self.tblVwUserList.reloadData()
    }
    
    func didFailedUserListAPI(message: String) {
        // hide loading
        // show message
    }
}

extension UserListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: UserListCell.identifier) as? UserListCell {
            cell.user = self.userList?[indexPath.row]
            return cell
        } else {
            return UserListCell()
        }
    }
}
