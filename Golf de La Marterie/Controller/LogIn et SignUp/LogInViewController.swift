//
//  LogInViewController.swift
//  Golf de La Marterie
//
//  Created by Guillaume Roy on 15/03/2021.
//

import UIKit
import FirebaseAuth
import CoreData

class LogInViewController: UIViewController {
    
    
    @IBOutlet weak var mailTF: UITextField!
    @IBOutlet weak var paswoordTf: UITextField!
    @IBOutlet weak var logInAuto: UISwitch!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        mailTF.delegate = self
        paswoordTf.delegate = self
        errorLabel.alpha = 0.0
        logInAuto.isOn = false
        if automaticLogIn == [] {
            let autolog = AutoLog(context: context)
            autolog.autoLogIn = false
            Save()
        }
    }

    func getAutoLog(){
        do{
            automaticLogIn = try context.fetch(AutoLog.fetchRequest())
        } catch{
        }
    }
    
    @IBAction func ConnectionPressed(_ sender: Any) {
        let mail = mailTF.text!
        let password = paswoordTf.text!
        if mail != "" || password != "" {
            Auth.auth().signIn(withEmail: mail, password: password) { (result, error) in
                if error != nil {
                    self.errorLabel.text = error!.localizedDescription
                    self.errorLabel.alpha = 1.0
                } else {
                    let startController = self.storyboard?.instantiateViewController(identifier: "HomeVC") as? homeController
                    self.view.window?.rootViewController = startController
                    self.view.window?.makeKeyAndVisible()
                }
            }
        }
    }
    @IBAction func logInAutoPressed(_ sender: Any) {
        if logInAuto.isOn == true{
            let pattern = automaticLogIn[0]
            print(pattern)
            pattern.autoLogIn = true
            Save()
            print(pattern)
        } else {
            let pattern = automaticLogIn[0]
            print(pattern)
            pattern.autoLogIn = false
            Save()
            print(pattern)
        }
    }
    
    
    
}
extension LogInViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
