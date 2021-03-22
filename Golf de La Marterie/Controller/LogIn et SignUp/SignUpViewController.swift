//
//  SignUpViewController.swift
//  Golf de La Marterie
//
//  Created by Guillaume Roy on 15/03/2021.
//

import UIKit
import FirebaseAuth
import Firebase
import CoreData


class SignUpViewController: UIViewController {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var familyNameTF: UITextField!
    @IBOutlet weak var mailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    var joueur : [Joueurs]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPlayers()
        errorLabel.alpha = 0.0
        nameTF.delegate = self
        familyNameTF.delegate = self
        mailTF.delegate = self
        passwordTF.delegate = self
        nameTF.text = joueur[0].name
        familyNameTF.text = joueur[0].surname
    }
    
// Verification des champs:
    func verif() -> String? {
        if nameTF.text == "" || familyNameTF.text == "" || mailTF.text == "" ||  passwordTF.text == "" {
            return "merci de remplir tous les champs"
        }
        let cleanedPassword = passwordTF.text!
        if passwordTest(cleanedPassword) == false{
            return "le mot de passe doit faire 8 caractères, contenir au moins 1 caractére spécial et 1 nombre"
        }
        return nil
    }
// Verification sécurité du mot de passe:
    func passwordTest(_ password: String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
// Affichage de l'erreur:
    func showError(_ error: String){
        errorLabel.text = error
        errorLabel.alpha = 1.0
    }
// Initialiser L'initial View Controller:
    func transitionToHome(){
        let startController = storyboard?.instantiateViewController(identifier: "HomeVC") as? homeController
        view.window?.rootViewController = startController
        view.window?.makeKeyAndVisible()
        view.window?.becomeKey()
    }
// Obtenir le profil Joueur depuis CoreData:
    func getPlayers(){
        do{
        self.joueur = try context.fetch(Joueurs.fetchRequest())
    } catch{
        print("error")
    }
}
    
//Inscription du joueur dans FireBase et UserID dans CoreData
    @IBAction func SignUpPressed(_ sender: Any) {
        let error = verif()
        
        if error != nil{
            showError(error!)
        }
        else {
            let prenom = nameTF.text!
            let nom = familyNameTF.text!
            let mail = mailTF.text!
            userID = getUserDocID(prenom, nom)
            Auth.auth().createUser(withEmail: mail, password: passwordTF.text!) { (result, err) in
                if err != nil {
                    self.showError("Error creating User")
                } else {
                    let player = self.joueur[0]
                    player.ide = userID
                    Save()
                    dataBase.collection("Users").document(userID).setData(["Prénom": prenom, "nom": nom, "mail": mail, "identifiant": result!.user.uid]) { (error) in
                        if error != nil {
                            self.showError("User data couldn't be save")
                        }
                    }
//                    transiton to home
                    self.transitionToHome()
                }
            }
        }
    }
}
extension SignUpViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}

