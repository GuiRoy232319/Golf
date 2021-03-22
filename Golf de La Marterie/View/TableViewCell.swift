//
//  TableViewCell.swift
//  Golf La Marterie
//
//  Created by Guillaume Roy on 15/01/2021.
//

import UIKit

class TableViewCell: UITableViewCell {
 
    @IBOutlet weak var GreenIV: UIImageView!
    @IBOutlet weak var DistanceLbl: UILabel!
    @IBOutlet weak var HCPLbl: UILabel!
    @IBOutlet weak var ParLbl: UILabel!
    @IBOutlet weak var fairwayLabel: UILabel!
    @IBOutlet weak var GIRLabel: UILabel!
    @IBOutlet weak var puttsLabel: UILabel!
    @IBOutlet weak var coupsLabel: UILabel!
    
    var trou : Parcours!
    

}

