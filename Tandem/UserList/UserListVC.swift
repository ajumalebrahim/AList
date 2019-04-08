//
//  UserListVC.swift
//  Tandem
//
//  Created by Ayman Banani on 4/8/19.
//  Copyright © 2019 Ajumal Ebrahim. All rights reserved.
//

import UIKit

class UserListVC: UIViewController {
    
    // MARK: - OutLets
    @IBOutlet private weak var tblVwUserList: UITableView!
    
    // MARK: -
    var vm = UserListVM()
    // MARK: - View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupVM()
        vm.callUserListAPI()
    }
    
    // MARK: - Private methods
    private func setupVM() {
        vm.delegate = self
    }

}

extension UserListVC: UserListVMDelegate {
    func willCallUserListAPI() {
        // show loading
    }
    
    func didSuccesUserListAPI() {
        // hide loading
    }
    
    func didFailedUserListAPI() {
        // hide loading
    }
    
    
}
