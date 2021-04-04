//
//  NewPartieViewController.swift
//  Golf de La Marterie
//
//  Created by Guillaume Roy on 26/01/2021.
//

import UIKit
import CoreData


class NewPartieViewController: UIViewController{

    @IBOutlet weak var PlayGame: UIPickerView!
    @IBOutlet weak var TB: UITableView!
    @IBOutlet weak var competitionLabel: UILabel!
    @IBOutlet weak var signatureLabel: UILabel!
    @IBOutlet weak var modePicker: ModeDeJeuPickerView!
    @IBOutlet weak var Competition: UISwitch!
    @IBOutlet weak var signature: UISwitch!
    
    let mode : [String] = ["StrokePlay", "Stableford","MatchPlay", "Scramble","Foursome","Greensome","Chapman", "Course à la Ficelle"]
    
    var formule : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        getPlayer()
        getPlayerPartie()
        setupjoueur()
        ReloadData()
        formule = modePicker.mode[0]
    }
//SetupView:
    func setupView(){
        signature.isOn = false
        Competition.isOn = false
        modePicker.delegate = self
        modePicker.dataSource = self
        TB.delegate = self
        TB.dataSource = self
        TB.separatorStyle = .none
    }
    
// Refresh:
    @IBAction func refresh(_ sender: Any) {
        getPlayerPartie()
        TB.reloadData()
    }
    
// GetPlayer & setup Joueurs TB & ReloadData:

    func setupjoueur(){
        if joueur == [] {
        let monjoueur = joueur[0]
            let newplayer = PartieJoueur(context: context)
            newplayer.index = monjoueur.index
            newplayer.prenom = monjoueur.name
            newplayer.nom = monjoueur.surname
            newplayer.coupsrendus = monjoueur.coupsrecus
            newplayer.boule = monjoueur.depart
            do {
                try context.save()
            } catch {
            }
            getPlayerPartie()
            TB.reloadData()
        }
    }
    func ReloadData(){
        TB.reloadData()
    }
    
// Boutons:
    @IBAction func competitionSwitch(_ sender: Any) {
        if Competition.isOn{
            competitionLabel.text = "Oui"
            competitionLabel.textColor = .blue
        } else {
            competitionLabel.text = "Non"
            competitionLabel.textColor = .black
        }
    }
    @IBAction func signatureSwitch(_ sender: Any) {
        if signature.isOn{
            signatureLabel.text = "Oui"
            signatureLabel.textColor = .blue
        } else {
            signatureLabel.text = "Non"
            signatureLabel.textColor = .black
        }
    }
    @IBAction func CreationPartie(_ sender: Any) {
        
    }
}
// TableView réglages:
extension NewPartieViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partie.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "partiejoueur", for: indexPath) as! PlayerTableViewCell
        cell.IV.image = UIImage(named: "\( partie[indexPath.row].boule!)")
        cell.NameLabel.text = partie[indexPath.row].prenom
        cell.SurnameLabel.text = partie[indexPath.row].nom
        cell.coupsRecusLabel.text = "Coups Reçus: \(partie[indexPath.row].coupsrendus)"
        return cell
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Supprimer") { (action, view, completionHandler) in
            let supprimer = partie[indexPath.row]
            context.delete(supprimer)
            do {
                try context.save()
            } catch {
            }
            getPlayerPartie()
            tableView.reloadData()
        }
        return UISwipeActionsConfiguration(actions: [action])
}
}
// PickerView réglages:
extension NewPartieViewController: UIPickerViewDelegate, UIPickerViewDataSource{
   
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return mode.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(mode[row])"
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        return  formule = mode[row]
        }
}

