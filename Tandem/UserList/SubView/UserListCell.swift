//
//  UserListCell.swift
//  Tandem
//
//  Created by Ajumal Ebrahim on 4/8/19.
//  Copyright © 2019 Ajumal Ebrahim. All rights reserved.
//

import UIKit

class UserListCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet private weak var lblName: UILabel!
    @IBOutlet private weak var imgvwAvatar: UIImageView!
    
    // MARK: - Variables
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    var user: UserElement? {
        didSet {
            config()
        }
    }
    
    // MARK: - override
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Private methods
    
    private func config() {
        self.lblName.text = user?.name
    }
    
}
