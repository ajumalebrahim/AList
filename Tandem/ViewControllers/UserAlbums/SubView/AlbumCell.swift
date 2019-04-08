//
//  AlbumCell.swift
//  Tandem
//
//  Created by Ayman Banani on 4/8/19.
//  Copyright © 2019 Ajumal Ebrahim. All rights reserved.
//

import UIKit
import SDWebImage

class AlbumCell: UICollectionViewCell {
    // MARK: - Outlets
    @IBOutlet private weak var lblImgName: UILabel!
    @IBOutlet private weak var imgvw: UIImageView!
    
    // MARK: - Variables
    var album: Album? {
        didSet {
            config()
        }
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    // MARK: - override
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func config() {
        self.imgvw.sd_setImage(with: URL(string:self.album?.url ?? ""))
        self.lblImgName.text = "\(self.album?.id ?? 0 )"
    }
    

}
