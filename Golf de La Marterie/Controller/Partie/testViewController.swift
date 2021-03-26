//
//  testViewController.swift
//  Golf de La Marterie
//
//  Created by Guillaume Roy on 19/03/2021.
//

import UIKit

class testViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var partie : [PartieJoueur]!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        getPartiePlayer()

    }
    
// Get PartiePlayer()
    func getPartiePlayer(){
        do{
            self.partie = try context.fetch(PartieJoueur.fetchRequest())
        } catch {
        }
    }
        
// Prepare For Segue:
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "holeDetail"{
            let next = segue.destination as! ScoringViewController
            next.trou = sender as? Parcours
        }
    }
}
// TableView Delegate & DataSource:
extension testViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return partie.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }
        if section == 1{
            return 1
        }
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Players", for: indexPath) as! TestTableViewCell
        cell.setupCollectionView(self, forRow: indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       let view = UIView()
        view.backgroundColor = .clear
        let label = UILabel()
        label.text = partie[section].prenom
        label.frame = CGRect(x: 0, y: 0, width: 150, height: 24)
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 18)
        view.addSubview(label)
        return view
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
// CollectionView Delegate & DataSource:
extension testViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return LaMarterie.count
    }
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Trou", for: indexPath) as! TestCollectionViewCell
    cell.setupTextFieldDelegate(self, forRow: indexPath.row)
    cell.trouLabel.text = "Trou N°\(LaMarterie[indexPath.row].numTrou)"
    cell.parLabel.text = "Par \(LaMarterie[indexPath.row].parTrou)"
    cell.hcpLabel.text = "Hcp: \(LaMarterie[indexPath.row].HCP)"
    cell.scoreTF.delegate = self
    cell.scoreLabel.alpha = 0.0
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = LaMarterie[indexPath.item]
        performSegue(withIdentifier: "holeDetail", sender: item)
    }
}
// TextField Delegate:
extension testViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}

