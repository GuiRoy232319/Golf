//
//  ProfilLogInViewController.swift
//  Golf de La Marterie
//
//  Created by Guillaume Roy on 18/03/2021.
//

import UIKit
import CoreData

class ProfilLogInViewController: UIViewController {

    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var familyNameTf: UITextField!
    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var genderSwitch: UISwitch!
    @IBOutlet weak var indexStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTF()
        indexStepper.stepValue = 0.1
        genderLabel.text = "Homme"
        genderSwitch.isOn = true
        indexLabel.text = "Index: \(indexStepper.value)"
        
    }
//Setup ShouldReturn
    func setupTF(){
        nameTF.delegate = self
        familyNameTf.delegate = self
    }
// Fonctions des Boutons:
    @IBAction func SwitchPressed(_ sender: Any) {
        if genderSwitch.isOn == true {
            genderLabel.text = "Homme"
        } else { genderLabel.text = "Femme"}
    }
    @IBAction func stepperIndex(_ sender: Any) {
        let value : Double = round(10 * (indexStepper.value)) / 10
        indexLabel.text = "Index: \(value)"
    }
// Enregristrement Profil CoreData
    @IBAction func UserCoreDataCreate(_ sender: Any) {
        let prenom = nameTF.text
        let nom = familyNameTf.text
        let index = round(10 * indexStepper.value) / 10
        let newPlayer = Joueurs(context: context)
        newPlayer.name = prenom
        newPlayer.surname = nom
        newPlayer.ide = "\(prenom!) \(nom!)"
        newPlayer.gender = genderLabel.text
        newPlayer.index = index
        let coul = depart(ind: newPlayer.index, gender: newPlayer.gender!)
            newPlayer.depart = coul.Start
            newPlayer.slope = coul.slope
            newPlayer.sss = coul.SSS
        let coupsrendus = Int64(coupRecus(slope: coul.slope, SSS: coul.SSS, index: newPlayer.index , Par: 73))
            newPlayer.coupsrecus = coupsrendus
        Save()
    }
}
extension ProfilLogInViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
