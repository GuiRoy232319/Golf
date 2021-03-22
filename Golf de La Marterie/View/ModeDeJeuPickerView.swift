//
//  ModeDeJeuPickerView.swift
//  Golf de La Marterie
//
//  Created by Guillaume Roy on 27/01/2021.
//

import UIKit

class ModeDeJeuPickerView: UIPickerView {
   
    let mode : [String] = ["StrokePlay", "Stableford","MatchPlay", "Scramble","Foursome","Greensome","Chapman", "Course à la Ficelle"]
    
   func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return mode.count
    }
}
