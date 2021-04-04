//
//  Partie & Trou.swift
//  Golf de La Marterie
//
//  Created by Guillaume Roy on 29/03/2021.
//

import Foundation
import UIKit


struct Trou{
    var holeNumber: Int64
    var par : Int64 = 1
    var HCP: Int64
    var coupsrecus: Int64?
    var numberShoots: Int64? = 1
    var numberPutts: Int64? = 1
    var greenInRegulation: Bool
    

}
func verifGreenInRegulation(par: Int64, numberOfShoots: Int64, numberOfPutts: Int64) -> Bool {
    if numberOfShoots - numberOfPutts <= par - 2{
      return true
    } else {
        return false
    }
}

