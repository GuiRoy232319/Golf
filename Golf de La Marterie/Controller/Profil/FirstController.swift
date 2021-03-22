//
//  FirstController.swift
//  Golf La Marterie
//
//  Created by Guillaume Roy on 05/01/2021.
//

import UIKit
import CoreData

class FirstController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var indexPicker: UIPickerView!
    @IBOutlet weak var validationButton: UIButton!
    @IBOutlet weak var genderSwitch: UISwitch!

    var index = 0.0
    var entier = 0
    var decimal = 0.0
    
    var Players: [Joueurs]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        genderSwitch.isOn = true
        gender.text = "Homme"
        
        
        indexPicker.delegate = self
        indexPicker.dataSource = self
        
        validationButton.layer.cornerRadius = validationButton.frame.height / 2
        validationButton.layer.borderWidth = 1
        validationButton.layer.borderColor = UIColor.gray.cgColor
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(tap)
        
}
// CloseKeyboard:
    @objc func closeKeyboard() {
        view.endEditing(true)
    }
// Switch:
    @IBAction func switchPressed(_ sender: UISwitch) {
        if genderSwitch.isOn {
            gender.text = "Homme"
        } else { gender.text = "Femme"}
    }
// Get Player:
    func getPlayer(){
        do{
            self.Players = try context.fetch(Joueurs.fetchRequest())
        } catch{
        }
    }
//   Index Picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return 54
        } else { return 10}
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row)"
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
        entier = row
            print(entier)
        }
        if component == 1{
        decimal = Double(row) / 10
            print(decimal)
        }
        return index = (Double(entier) + decimal)
    }

//    Validation
    @IBAction func ValidationPressed(_ sender: Any) {
            let newplayer = Joueurs(context: context)
            newplayer.gender = gender.text
            newplayer.index = index
            newplayer.name = Name.text
            newplayer.surname = firstName.text
        let coul = depart(ind: newplayer.index, gender: newplayer.gender!)
            newplayer.depart = coul.Start
            newplayer.slope = coul.slope
            newplayer.sss = coul.SSS
        let coupsrendus = Int64(coupRecus(slope: coul.slope, SSS: coul.SSS, index: newplayer.index , Par: 73))
            newplayer.coupsrecus = coupsrendus
        Save()
        getPlayer()
        dismiss(animated: true, completion: nil)
        ProfilViewController().viewDidLoad()
        }
}

