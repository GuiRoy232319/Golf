//
//  CourseTableViewController.swift
//  Golf La Marterie
//
//  Created by Guillaume Roy on 12/01/2021.
//

import UIKit

class CourseTableViewController: UITableViewController {

    var golf = LaMarterie
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    //TableView Configuration

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return golf.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Trou", for: indexPath) as! TrouTableViewCell
        cell.HcpLbl.text = "HCP : \(golf[indexPath.row].HCP)"
        cell.Parlbl.text = "Par : \(golf[indexPath.row].parTrou)"
        cell.IV.image = UIImage(named: golf[indexPath.row].holeGreen!)
        cell.distanceLBl.text = "Distance entrée de green : \(golf[indexPath.row].DistBlanc)m"
        cell.TrouLbl.text = "Trou n°\(golf[indexPath.row].numTrou)"
        cell.IV.layer.cornerRadius = cell.IV.frame.height / 2
        cell.IV.layer.borderWidth = 2
        cell.IV.layer.borderColor = UIColor.systemGray6.cgColor
        
        return cell
    }
   
 
    // Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail"{
            if  let next = segue.destination as? HoleViewController {
                next.trou = sender as? Parcours
            }
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let trou = golf[indexPath.item]
        performSegue(withIdentifier: "detail", sender: trou)
    }
   

}
