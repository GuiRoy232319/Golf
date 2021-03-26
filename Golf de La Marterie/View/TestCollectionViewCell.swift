//
//  TestCollectionViewCell.swift
//  Golf de La Marterie
//
//  Created by Guillaume Roy on 19/03/2021.
//

import UIKit

class TestCollectionViewCell: UICollectionViewCell {
    

    @IBOutlet weak var trouLabel: UILabel!
    @IBOutlet weak var hcpLabel: UILabel!
    @IBOutlet weak var parLabel: UILabel!
    @IBOutlet weak var scoreTF: UITextField!
    @IBOutlet weak var scoreLabel: UILabel!
    
    func setupScore(){
        scoreLabel.text = scoreTF.text
        scoreLabel.alpha = 1.0
        scoreTF.alpha = 0.0
    }
    func setupTextFieldDelegate<D: UITextFieldDelegate>(_ Delegate: D, forRow row: Int){
        scoreTF.delegate = Delegate
        scoreTF.tag = row
    }
}

