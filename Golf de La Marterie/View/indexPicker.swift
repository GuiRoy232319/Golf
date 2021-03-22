//
//  indexPicker.swift
//  Golf La Marterie
//
//  Created by Guillaume Roy on 06/01/2021.
//

import UIKit

class indexPicker: UIPickerView, UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return 54
        } else { return 10}
    }
   
    
        /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
