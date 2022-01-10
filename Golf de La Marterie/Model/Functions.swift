//
//  Functions.swift
//  Golf de La Marterie
//
//  Created by Guillaume Roy on 03/01/2022.
//

import Foundation
import UIKit

var i: Int = 0

//Implantation des Coups Recus en fonction de l'handicap de jeu
func implementCoupsRecus(){
    while coupsRecus != 0 {
        LaMarterie[i].coupsRendus += 1
            coupsRecus -= 1
            i += 1
            if i == 17{
                i = 0
            }
    }
}
