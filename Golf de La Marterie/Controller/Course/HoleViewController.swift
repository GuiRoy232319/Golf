//
//  HoleViewController.swift
//  Golf La Marterie
//
//  Created by Guillaume Roy on 15/01/2021.
//

import UIKit
import youtube_ios_player_helper
class HoleViewController: UIViewController, YTPlayerViewDelegate {
    var trou : Parcours!
    
  

    @IBOutlet weak var holeBG: UIImageView!
    @IBOutlet weak var trouAdvice: UILabel!
    @IBOutlet weak var trouGreenProf: UILabel!
    @IBOutlet weak var trouHCP: UILabel!
    @IBOutlet weak var trouPar: UILabel!
    @IBOutlet weak var trouNumber: UILabel!
    @IBOutlet weak var greenIV: UIImageView!
    @IBOutlet weak var distJaune: UILabel!
    @IBOutlet weak var distBlanc: UILabel!
    @IBOutlet weak var distBleu: UILabel!
    @IBOutlet weak var distRouge: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trouPar.text = "Par: \(trou.parTrou)"
        trouHCP.text = "HCP: \(trou.HCP)"
        trouNumber.text = "Trou N°\(trou.numTrou)"
        distBlanc.text = "\(trou.DistBlanc)m"
        distJaune.text = "\(trou.DistJaune)m"
        distBleu.text = "\(trou.DistBleu)m"
        distRouge.text = "\(trou.DistRouge)m"
        trouGreenProf.text = "Profondeur Green : \(trou.Greenprof)m"
        greenIV.image = UIImage(named: trou.holeGreen!)
        greenIV.layer.cornerRadius = greenIV.frame.height / 2
        greenIV.layer.borderWidth = 2
        greenIV.layer.borderColor = UIColor.systemGreen.cgColor
        holeBG.image = UIImage(named: "\(trou.holeBG!)")
    }
    
//Lecture automatique:
    
//    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
//        holeYT.playVideo()
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
