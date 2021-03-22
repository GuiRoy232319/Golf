//
//  ProfilViewController.swift
//  Golf La Marterie
//
//  Created by Guillaume Roy on 20/01/2021.
//

import UIKit
import Firebase
import CoreData


class ProfilViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var SurnameLabal: UILabel!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var indexPlayer: UILabel!
    @IBOutlet weak var DepartIv: UIImageView!
    @IBOutlet weak var userIV: RoundedImage!
    
    var joueur: [Joueurs] = []
    var picker: UIImagePickerController = UIImagePickerController()
     
    override func viewDidLoad() {
        super.viewDidLoad()
        getPlayer()
        picker.delegate = self
        picker.allowsEditing = true
        userIV.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapIV))
        userIV.addGestureRecognizer(tap)
        if joueur != [] {
            let monjoueur = joueur[0]
            NameLabel.text = monjoueur.name
            SurnameLabal.text = monjoueur.surname
            indexPlayer.text = "Index: \(monjoueur.index)"
            DepartIv.image = UIImage(named: "\(monjoueur.depart!)")
            if monjoueur.userimage != nil{
                userIV.image = UIImage(named:"\(monjoueur.userimage!)")
            }
            print(monjoueur.ide!)
            }
        }

    @objc func tapIV(){
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
        }

    
    func getPlayer(){
        do{
            self.joueur = try context.fetch(Joueurs.fetchRequest())
        }catch{
            }
        }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let photo = info[.originalImage] as? UIImage{
            userIV.image = photo
            let imageID = "userIV"
            photo.accessibilityIdentifier = imageID
            let player = joueur[0]
            player.userimage = imageID
            Save()
        }
        if let photoEdit = info[.editedImage] as? UIImage{
            userIV.image = photoEdit
            let player = joueur[0]
            let photoString = photoEdit.accessibilityIdentifier
            player.userimage = photoString
            Save()
        }
        picker.dismiss(animated: true, completion: nil)
    }
}

