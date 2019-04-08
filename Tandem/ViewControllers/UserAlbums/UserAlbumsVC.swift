//
//  UserAlbumsVC.swift
//  Tandem
//
//  Created by Ayman Banani on 4/8/19.
//  Copyright © 2019 Ajumal Ebrahim. All rights reserved.
//

import UIKit

class UserAlbumsVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet private weak var collectionVw: UICollectionView!
    // MARK: - Variables
    var albums: [Album]?
    
    // MARK: - View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }
    
    // MARK: - Private methods
    private func setupView() {
//        self.vm.delegate = self
        self.collectionVw.dataSource = self
        self.collectionVw.register(AlbumCell.nib, forCellWithReuseIdentifier: AlbumCell.identifier)
    }

}

extension UserAlbumsVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albums?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.cellForItem(at: indexPath) as? AlbumCell else {
             return AlbumCell()
        }
        
        return cell
    }
    
    
}
