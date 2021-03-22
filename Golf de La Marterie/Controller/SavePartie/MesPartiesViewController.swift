//
//  MesPartiesViewController.swift
//  Golf de La Marterie
//
//  Created by Guillaume Roy on 09/02/2021.
//

import UIKit

class MesPartiesViewController: UITableViewController{
    
    var MyParty : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        getCarte()
        
        
    }
// GetCarte:
    
//    func getCarte(){
//        do{
//            self.MyParty = try context.fetch(MesParties.fetchRequest())
//        } catch{
//            }
//        }
    
// MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return MyParty.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Sauvegarde", for: indexPath) as! MesPartiesViewCell

        // Configure the cell...

        return cell
    }
    
}

//// Segue & Perform:
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "mesParties"{
//            if  let next = segue.destination as? SavedPartieViewController {
//                next.trou = sender as? Any
//            }
//        }
//    }
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let trou = MyParty[indexPath.row].mesparties
//        performSegue(withIdentifier: "mesParties", sender: trou)
//    }
//    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let action = UIContextualAction(style: .destructive, title: "Supprimer") { (action, view, completionHandler) in
//            let supprimer = self.MyParty[indexPath.row].mesparties!
//            context.delete(supprimer)
//            Save()
//            self.getCarte()
//            self.tableView.reloadData()
//    }
//      return UISwipeActionsConfiguration(actions: [action])
//    }
//}
