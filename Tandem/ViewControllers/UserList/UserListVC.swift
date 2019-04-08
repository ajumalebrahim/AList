//
//  UserListVC.swift
//  Tandem
//
//  Created by Ajumal Ebrahim on 4/8/19.
//  Copyright © 2019 Ajumal Ebrahim. All rights reserved.
//

import UIKit
import MBProgressHUD

class UserListVC: UIViewController {
    
    // MARK: - OutLets
    @IBOutlet private weak var tblVwUserList: UITableView!
    
    // MARK: -
    var vm = UserListVM()
    private var userList: [UserListElement]?
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
        self.tblVwUserList.delegate = self
        self.tblVwUserList.register(UserListCell.nib, forCellReuseIdentifier: UserListCell.identifier)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showAlbum") {
            guard let row = (sender as? NSIndexPath)?.row else {
                return
            }
            let user = self.userList?[row]
            let vc = segue.destination as? UserAlbumsVC
            vc?.albums = user?.album
            
        }
    }

}

 // MARK: - extension
extension UserListVC: UserListVMDelegate {
    
    func willCallUserListAPI() {
        // show loading
        MBProgressHUD.showAdded(to: self.view, animated: true)
    }
    
    func didSuccesUserListAPI(users: UserList) {
        // hide loading
        MBProgressHUD.hide(for: self.view, animated: true)
        userList = users
        self.tblVwUserList.reloadData()
    }
    
    func didFailedUserListAPI(message: String) {
        // hide loading
        MBProgressHUD.hide(for: self.view, animated: true)
        
        // show message
    }
}

extension UserListVC: UITableViewDataSource, UITableViewDelegate {
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showAlbum", sender: indexPath)
    }
}
