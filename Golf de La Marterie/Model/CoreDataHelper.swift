//
//  CoreDataHelper.swift
//  Golf de La Marterie
//
//  Created by Guillaume Roy on 26/01/2021.
//

import Foundation
import CoreData
import UIKit

let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

func Save(){
    do{
    try context.save()
} catch{
}
}
var automaticLogIn : [AutoLog] = []



