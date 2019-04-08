//
//  UserListCell.swift
//  Tandem
//
//  Created by Ayman Banani on 4/8/19.
//  Copyright © 2019 Ajumal Ebrahim. All rights reserved.
//

import UIKit

class UserListCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet private weak var lblName: UILabel!
    @IBOutlet private weak var imgvwAvatar: UIImageView!
    
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
    
    
}
