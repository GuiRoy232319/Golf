//
//  AddPlayerViewController.swift
//  Golf de La Marterie
//
//  Created by Guillaume Roy on 26/01/2021.
//

import UIKit
import CoreData


class AddPlayerViewController: UIViewController {

    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var IndexLabel: UILabel!
    @IBOutlet weak var IndexSlider: UISlider!
    @IBOutlet weak var SurnameTF: UITextField!
    @IBOutlet weak var NameTF: UITextField!
    @IBOutlet weak var genderSwitch: UISwitch!
    @IBOutlet weak var GenderLabel: UILabel!
    
    var index : Double = 27.0
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
//        getPlayer()
        getPlayerPartie()
        switchSetup()
        tableViewSetup()
        TableView.reloadData()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardUp), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDown), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
// Keyboard Up and Down:

@objc func keyboardUp(){
    if self.view.frame.origin.y == 0{
        UIView.animate(withDuration: 0.5){
            self.view.frame.origin.y = -300
            }
        }
}
@objc func keyboardDown(){
        if self.view.frame.origin.y != 0{
            UIView.animate(withDuration: 0.5){
                self.view.frame.origin.y = 0
            }
        }
    }

// SetupView:
    func setupView(){
        NameTF.delegate = self
        SurnameTF.delegate = self
        IndexLabel.text = "\(index)"
    }
// Switch:
    func switchSetup(){
        genderSwitch.isOn = true
        GenderLabel.text = "Homme"
    }
    @IBAction func SwitchChanged(_ sender: Any) {
        if genderSwitch.isOn{
            GenderLabel.text = "Homme"
        } else {
            GenderLabel.text = "Femme"
        }
    }

// Validation & Création d'un Nouveau Joueur:
    
    @IBAction func Slider(_ sender: Any) {
        index = Double(IndexSlider.value)
        index = Double(round(10*index)/10)
        IndexLabel.text = "\(index)"
    }
    
    @IBAction func NewPlayerCreated(_ sender: Any) {
        let newplayer = Joueurs(context: context)
        newplayer.name = NameTF.text
        newplayer.surname = SurnameTF.text
        newplayer.gender = GenderLabel.text
        newplayer.index = index
        let coul = depart(ind: newplayer.index, gender: newplayer.gender!)
            newplayer.depart = coul.Start
            newplayer.slope = coul.slope
            newplayer.sss = coul.SSS
        let coupsrendus = Int64(coupRecus(slope: coul.slope, SSS: coul.SSS, index: newplayer.index , Par: 73))
            newplayer.coupsrecus = coupsrendus
        Save()
        getPlayer()
        TableView.reloadData()
        NameTF.text = ""
        SurnameTF.text = ""
        genderSwitch.isOn = true
        IndexSlider.value = 25
    }
}

//TableView:
extension AddPlayerViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableViewSetup(){
        TableView.delegate = self
        TableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return joueur.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableView.dequeueReusableCell(withIdentifier: "joueur", for: indexPath) as! AllPlayerTableViewCell
        cell.NamePlayer.text = joueur[indexPath.row].name
        cell.SurNamePlayer.text = joueur[indexPath.row].surname
        cell.IndexPlayer.text = "Index: \(joueur[indexPath.row].index)"
        cell.DepartIV.image = UIImage(named: "\(joueur[indexPath.row].depart!)")
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
        }

//Ajouter un joueur:
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "Ajouter à la partie") {(action, view, completionHandler) in
            let ajouterJoueur = joueur[indexPath.row]
            let newplayer = PartieJoueur(context: context)
            newplayer.boule = ajouterJoueur.depart
            newplayer.coupsrendus = ajouterJoueur.coupsrecus
            newplayer.index = ajouterJoueur.index
            newplayer.nom = ajouterJoueur.surname
            newplayer.prenom = ajouterJoueur.name
            Save()
            self.dismiss(animated: true, completion: nil)
            }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
//    Supprimer un Joueur:
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Supprimer") { (action, view, completionHandler) in
            let supprimer = joueur[indexPath.row]
            context.delete(supprimer)
            Save()
            getPlayer()
            tableView.reloadData()
    }
      return UISwipeActionsConfiguration(actions: [action])
    }

}

// CloseKeyboard:
extension AddPlayerViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
