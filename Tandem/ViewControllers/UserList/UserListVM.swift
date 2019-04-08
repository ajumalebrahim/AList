//
//  UserListVM.swift
//  Tandem
//
//  Created by Ajumal Ebrahim on 4/8/19.
//  Copyright © 2019 Ajumal Ebrahim. All rights reserved.
//

import Foundation
import Alamofire

protocol UserListVMDelegate {
    func willCallUserListAPI()
    func didSuccesUserListAPI(users: UserList)
    func didFailedUserListAPI(message: String)
}

class UserListVM {
    // MARK: -  variables
    var delegate: UserListVMDelegate?
    
    private let urlStr = "https://my-json-server.typicode.com/ajumalebrahim/servertest/userList"
    
    // MARK: - 
    func callUserListAPI() {
        self.delegate?.willCallUserListAPI()
        guard let url = URL(string:self.urlStr ) else {
            return
        }
        
        Alamofire.request(url).responseUserList { response in
            if let user = response.result.value {
                self.delegate?.didSuccesUserListAPI(users: user)
            } else {
                self.delegate?.didFailedUserListAPI(message: "Something went wrong...")
            }
        }
    }
}
