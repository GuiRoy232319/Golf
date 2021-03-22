//
//  TestTableViewCell.swift
//  Golf de La Marterie
//
//  Created by Guillaume Roy on 19/03/2021.
//

import UIKit

class TestTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    func setupCollectionView<D: UICollectionViewDelegate & UICollectionViewDataSource>(_ dataSourceDelegate: D, forRow row: Int){
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.reloadData()
    }
}
