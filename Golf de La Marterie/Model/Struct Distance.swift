//
//  Struct Distance.swift
//  Golf La Marterie
//
//  Created by Guillaume Roy on 14/01/2021.
//

import Foundation

struct Distance {
    var numTrou: Int
    var distance : Int
    var color : color
}
var Dist: [Distance] = [
    Distance(numTrou: 1, distance: 404, color: .Blanc),
    Distance(numTrou: 1, distance: 404, color: .Jaune),
    Distance(numTrou: 1, distance: 349, color: .Bleu),
    Distance(numTrou: 1, distance: 349, color: .Rouge),
    Distance(numTrou: 2, distance: 343, color: .Blanc),
    Distance(numTrou: 2, distance: 343, color: .Jaune),
    Distance(numTrou: 2, distance: 314, color: .Bleu),
    Distance(numTrou: 2, distance: 314, color: .Rouge),
    Distance(numTrou: 3, distance: 108, color: .Blanc),
    Distance(numTrou: 3, distance: 108, color: .Jaune),
    Distance(numTrou: 3, distance: 95, color: .Bleu),
    Distance(numTrou: 3, distance: 91, color: .Rouge),
    Distance(numTrou: 4, distance: 346, color: .Blanc),
    Distance(numTrou: 4, distance: 301, color: .Jaune),
    Distance(numTrou: 4, distance: 295, color: .Bleu),
    Distance(numTrou: 4, distance: 274, color: .Rouge),
    Distance(numTrou: 5, distance: 301, color: .Blanc),
    Distance(numTrou: 5, distance: 278, color: .Jaune),
    Distance(numTrou: 5, distance: 267, color: .Bleu),
    Distance(numTrou: 5, distance: 256, color: .Rouge),
    Distance(numTrou: 6, distance: 448, color: .Blanc),
    Distance(numTrou: 6, distance: 430, color: .Jaune),
    Distance(numTrou: 6, distance: 412, color: .Bleu),
    Distance(numTrou: 6, distance: 394, color: .Rouge),
    Distance(numTrou: 7, distance: 290, color: .Blanc),
    Distance(numTrou: 7, distance: 260, color: .Jaune),
    Distance(numTrou: 7, distance: 225, color: .Bleu),
    Distance(numTrou: 7, distance: 222, color: .Rouge),
    Distance(numTrou: 8, distance: 447, color: .Blanc),
    Distance(numTrou: 8, distance: 429, color: .Jaune),
    Distance(numTrou: 8, distance: 385, color: .Bleu),
    Distance(numTrou: 8, distance: 380, color: .Rouge),
    Distance(numTrou: 9, distance: 347, color: .Blanc),
    Distance(numTrou: 9, distance: 330, color: .Jaune),
    Distance(numTrou: 9, distance: 278, color: .Bleu),
    Distance(numTrou: 9, distance: 272, color: .Rouge),
    Distance(numTrou: 10, distance: 490, color: .Blanc),
    Distance(numTrou: 10, distance: 456, color: .Jaune),
    Distance(numTrou: 10, distance: 436, color: .Bleu),
    Distance(numTrou: 10, distance: 408, color: .Rouge),
    Distance(numTrou: 11, distance: 317, color: .Blanc),
    Distance(numTrou: 11, distance: 282, color: .Jaune),
    Distance(numTrou: 11, distance: 268, color: .Bleu),
    Distance(numTrou: 11, distance: 234, color: .Rouge),
    Distance(numTrou: 12, distance: 390, color: .Blanc),
    Distance(numTrou: 12, distance: 364, color: .Jaune),
    Distance(numTrou: 12, distance: 344, color: .Bleu),
    Distance(numTrou: 12, distance: 304, color: .Rouge),
    Distance(numTrou: 13, distance: 178, color: .Blanc),
    Distance(numTrou: 13, distance: 165, color: .Jaune),
    Distance(numTrou: 13, distance: 149, color: .Bleu),
    Distance(numTrou: 13, distance: 130, color: .Rouge),
    Distance(numTrou: 14, distance: 268, color: .Blanc),
    Distance(numTrou: 14, distance: 255, color: .Jaune),
    Distance(numTrou: 14, distance: 202, color: .Bleu),
    Distance(numTrou: 14, distance: 202, color: .Rouge),
    Distance(numTrou: 15, distance: 260, color: .Blanc),
    Distance(numTrou: 15, distance: 254, color: .Jaune),
    Distance(numTrou: 15, distance: 234, color: .Bleu),
    Distance(numTrou: 15, distance: 230, color: .Rouge),
    Distance(numTrou: 16, distance: 302, color: .Blanc),
    Distance(numTrou: 16, distance: 297, color: .Jaune),
    Distance(numTrou: 16, distance: 243, color: .Bleu),
    Distance(numTrou: 16, distance: 243, color: .Rouge),
    Distance(numTrou: 17, distance: 372, color: .Blanc),
    Distance(numTrou: 17, distance: 358, color: .Jaune),
    Distance(numTrou: 17, distance: 329, color: .Bleu),
    Distance(numTrou: 17, distance: 294, color: .Rouge),
    Distance(numTrou: 18, distance: 165, color: .Blanc),
    Distance(numTrou: 18, distance: 151, color: .Jaune),
    Distance(numTrou: 18, distance: 131, color: .Bleu),
    Distance(numTrou: 18, distance: 127, color: .Rouge)
    ]

enum color: String, CaseIterable {
   case Blanc
    case Jaune
    case Bleu
    case Rouge
    }

func from(_ depart: color) -> [Distance]{
    return Dist.filter({$0.color == depart})
    }

struct Dist_Depart {
    var trou : [Distance]
}

var blanc = Dist_Depart(trou: from(.Blanc))
var jaune = Dist_Depart(trou: from(.Jaune))
var bleu = Dist_Depart(trou: from(.Bleu))
var rouge = Dist_Depart(trou: from(.Rouge))



























