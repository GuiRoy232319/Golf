//
//  ScoringViewController.swift
//  Golf de La Marterie
//
//  Created by Guillaume Roy on 05/02/2021.
//

import UIKit
import MapKit
import CoreLocation

class ScoringViewController: UIViewController {
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var trouLabel: UILabel!
    @IBOutlet weak var hcpLabel: UILabel!
    @IBOutlet weak var coupsRendu: UILabel!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var SurnameLabel: UILabel!
    @IBOutlet weak var distEntrée: UILabel!
    @IBOutlet weak var distSortie: UILabel!
    @IBOutlet weak var Parcours: MKMapView!
    
    var trou : Parcours!
    var putts : String = ""
    var coups : String = ""
    var fairway : String = ""
    var Player: [PartieJoueur]!
    
    var manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getPlayer()
//        getCarte()
        let dat = Date()
        let jour = DateConvertir(date: dat)
        date.text = "le \(jour)"
        trouLabel.text = "Trou N°\(trou.numTrou)"
        coupsRendu.text = "HCP: \(trou.HCP)"
        hcpLabel.text = "Par: \(trou.parTrou)"
        let monjoueur = Player[0]
        NameLabel.text = monjoueur.prenom
        SurnameLabel.text = monjoueur.nom
        setupManager()
        
        
    }
// Bouton Coups, Fairway & Putts:
//    @IBAction func coupsCount(_ sender: Any) {
//        let coups = Int(coupsStepper.value)
//        coupsTF.text = "\(coups)"
//        if coups > trou.parTrou {
//            coupsTF.textColor = .systemRed
//        }
//        if coups == trou.parTrou{
//            coupsTF.textColor = .systemBlue
//        }
//        if coups < trou.parTrou {
//            coupsTF.textColor = .systemGreen
//        }
//    }
//    @IBAction func puttsCount(_ sender: Any) {
//        let putts = Int(puttsStepper.value)
//        puttsTF.text = "\(putts)"
//        if putts > 2 {
//            puttsTF.textColor = .systemRed
//        }
//        if putts <= 2 {
//            puttsTF.textColor = .systemGreen
//        }
//    }
//    @IBAction func fairwayTouch(_ sender: Any) {
//        if fairwaySwitch.isOn == true{
//            fairwayLabel.text = "Oui"
//            fairwayLabel.textColor = .systemGreen
//        } else {
//            fairwayLabel.text = "Non"
//            fairwayLabel.textColor = .black
//        }
//    }
//
// GetCarte:
    func getPlayer(){
        do{
            self.Player = try context.fetch(PartieJoueur.fetchRequest())
        } catch{
            }
        }
        
//Fonctions:
    func DateConvertir(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "fr_FR")
        return dateFormatter.string(from: date)
    }
    
//Validation & Sauvegarde:
    @IBAction func ValidationAndSave(_ sender: Any) {
//        let carteUpdate = Carte(context: context)
//        carteUpdate.coups = Int64(coupsStepper.value)
//        carteUpdate.putts = Int64(puttsStepper.value)
//        carteUpdate.fairway = fairwayLabel.text
//        carteUpdate.prenom = NameLabel.text
//        carteUpdate.nom = SurnameLabel.text
//        carteUpdate.trou = Int64(trou.numTrou)
//
//        Save()
//        getCarte()
//        print(Carte.self)
//        print(Score.count)
        dismiss(animated: true, completion: nil)
    }
}

//CoreLocation
extension ScoringViewController: CLLocationManagerDelegate{
    
    func setupManager(){
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus{
        case .authorizedAlways : print("Always")
        case .authorizedWhenInUse : print("En Utilisation uniquement")
        case .denied : print("Refusé")
        case .notDetermined : print("Non Déterminé")
        case .restricted : print("Limité")
        default: print("Ohter")
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        Erreur de position:
        print(error.localizedDescription)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let first =  locations.first {
           let coordinates = first.coordinate
            let center : CLLocationCoordinate2D = coordinates
            let delta = 0.0025
            let span = MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
            let region = MKCoordinateRegion(center: center, span: span)
            Parcours.setRegion(region, animated: true)
            let maPostion = manager.location
            let postionEntrée = trou.entréeGreen
            let postionSortie = trou.sortieGreen
            var distEntré = maPostion?.distance(from: postionEntrée)
            var disSorti = maPostion?.distance(from: postionSortie)
            distEntré = distEntré?.rounded()
            disSorti = disSorti?.rounded()
            distEntrée.text = "\(distEntré!)m"
            distSortie.text = "\(disSorti!)m"
            
            
            }
        }
    }
//extension ScoringViewController: UITextFieldDelegate{
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        view.endEditing(true)
//        return true
//    }
//}
