//
//  TestCollectionViewCell.swift
//  Golf de La Marterie
//
//  Created by Guillaume Roy on 19/03/2021.
//

import UIKit
import RxSwift

class TestCollectionViewCell: UICollectionViewCell {
    

    @IBOutlet weak var trouLabel: UILabel!
    @IBOutlet weak var hcpLabel: UILabel!
    @IBOutlet weak var parLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    let disposeBag = DisposeBag()
   
  

}
