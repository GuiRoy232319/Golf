//
//  CoreDataHelper.swift
//  Golf de La Marterie
//
//  Created by Guillaume Roy on 26/01/2021.
//

import Foundation
import CoreData
import UIKit

var joueur: [Joueurs] = []
var partie: [PartieJoueur] = []
var automaticLogIn : [AutoLog] = []
var carte:[Carte] = []

let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//Save
func Save(){
    do{
    try context.save()
} catch{
}
}
//Obtenir tous les joueurs:
func getPlayer(){
    do{
       joueur = try context.fetch(Joueurs.fetchRequest())
    } catch{
    }
}
//Obtenir les joueurs de la partie:
func getPlayerPartie(){
    do{
    partie = try context.fetch(PartieJoueur.fetchRequest())
 } catch{
 }
}
//Obtenir Carte
func getCarte(){
    do{
        carte = try context.fetch(Carte.fetchRequest())
    } catch{
        
    }
}

