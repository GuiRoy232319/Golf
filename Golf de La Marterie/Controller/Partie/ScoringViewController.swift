//
//  ScoringViewController.swift
//  Golf de La Marterie
//
//  Created by Guillaume Roy on 05/02/2021.
//

import UIKit
import MapKit
import CoreLocation
import RxSwift
import RxCocoa


class ScoringViewController: UIViewController {
    
    @IBOutlet weak var girLabel: UILabel!
    @IBOutlet weak var puttStepper: UIStepper!
    @IBOutlet weak var puttsLabel: UILabel!
    @IBOutlet weak var scoreStepper: UIStepper!
    @IBOutlet weak var scoreLabel: UILabel!
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
    var putts : Int64 = 0
//    private let coupsVariable = Varia 
    var fairway : String = ""

    
    var manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getPlayerPartie()

        let dat = Date()
        let jour = dateConvertir(date: dat)
        date.text = "le \(jour)"
        trouLabel.text = "Trou N°\(trou.numTrou)"
        coupsRendu.text = "HCP: \(trou.HCP)"
        hcpLabel.text = "Par: \(trou.parTrou)"
        let monjoueur = partie[0]
        NameLabel.text = monjoueur.prenom
        SurnameLabel.text = monjoueur.nom
        setupManager()
    }
      

    
//Validation & Sauvegarde:
    @IBAction func ValidationAndSave(_ sender: Any) {
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

