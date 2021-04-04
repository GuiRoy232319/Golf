//
//  DateFormatter.swift
//  Golf de La Marterie
//
//  Created by Guillaume Roy on 30/03/2021.
//

import Foundation
import UIKit

func dateConvertir(date: Date) -> String{
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = DateFormatter.Style.medium
    dateFormatter.timeStyle = .none
    dateFormatter.locale = Locale(identifier: "fr_FR")
    return dateFormatter.string(from: date)
}

func dateKey(date: Date) -> String{
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .short
    dateFormatter.timeStyle = .none
    dateFormatter.locale = Locale(identifier: "fr_FR")
    return dateFormatter.string(from: date)
}
