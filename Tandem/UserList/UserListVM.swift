//
//  UserListVM.swift
//  Tandem
//
//  Created by Ajumal Ebrahim on 4/8/19.
//  Copyright © 2019 Ajumal Ebrahim. All rights reserved.
//

import Foundation

protocol UserListVMDelegate {
    func willCallUserListAPI()
    func didSuccesUserListAPI()
    func didFailedUserListAPI()
}

class UserListVM {
    // MARK: -  variables
    var delegate: UserListVMDelegate?
    
    // MARK: - 
    func callUserListAPI() {
        delegate?.willCallUserListAPI()
    }
}
