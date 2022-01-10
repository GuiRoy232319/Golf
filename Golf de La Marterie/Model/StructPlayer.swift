//
//  Datas.swift
//  Golf La Marterie
//
//  Created by Guillaume Roy on 22/12/2020.
//

import Foundation
import UIKit

struct boule {
    var slope : Int64 = 0
    var SSS : Float = 0.0
    var Start : String
}
var slope : Int = 0
var SSS : Float = 0.0
var coupsRecus : Int = 0

func coupRecus(slope: Int64, SSS: Float, index: Double, Par: Int) -> Int{
        let first = (index * Double(slope)) / 113
        let second =  (SSS - Float(Par))
        coupsRecus = Int(first) + Int(second)
        return coupsRecus
    }

func depart(ind: Double, gender: String) -> boule{
        if ind >= 14.5 && gender == "Homme"{
            return boule(slope: 126, SSS: 70.6, Start: "Jaune")
        }
        if ind <= 14.5 && gender == "Homme" {
            return boule(slope: 136, SSS: 71.8, Start: "Blanc")
        }
        if ind >= 14.5 && gender == "Femme"{
            return boule(slope: 127, SSS: 71.8, Start: "Rouge")
        } else {
            return boule(slope: 129, SSS: 72.8, Start: "Bleu")
        }
    }


enum couleur: String, CaseIterable {
   case Blanc
    case Jaune
    case Bleu
    case Rouge
    }

enum gender: String, CaseIterable{
    case Homme
    case Femme
}


