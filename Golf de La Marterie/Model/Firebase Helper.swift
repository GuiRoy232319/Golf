//
//  Firebase Helpe.swift
//  Golf de La Marterie
//
//  Created by Guillaume Roy on 16/03/2021.
//

import Foundation
import Firebase

let dataBase = Firestore.firestore()

func getUserDocID(_ name: String,_ familyName: String) -> String{
    let result = "\(name) \(familyName)"
    return result
}

var userID : String!
