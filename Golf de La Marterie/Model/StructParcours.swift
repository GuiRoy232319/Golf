//
//  StructParcours.swift
//  Golf La Marterie
//
//  Created by Guillaume Roy on 14/01/2021.
//

import Foundation
import UIKit
import MapKit


struct Parcours{
    var numTrou : Int
    var parTrou : Int
    var HCP : Int
    var advice: String?
    var holeBG : String?
    var holeGreen : String?
    var DistBlanc: Int
    var DistJaune: Int
    var DistBleu : Int
    var DistRouge : Int
    var Greenprof : Int
    var entréeGreen : CLLocation
    var sortieGreen: CLLocation
    var youtubeID : String
    var coupsRendus : Int
}

var LaMarterie : [Parcours] = [
    Parcours(numTrou: 01, parTrou: 5, HCP: 15, advice: "", holeBG: "Hole1", holeGreen: "Green1",DistBlanc: 404, DistJaune: 404, DistBleu: 349, DistRouge: 349, Greenprof: 26, entréeGreen: entréeDeGreen[0], sortieGreen: sortieDeGreen[0], youtubeID: "Ep211IYPcIs", coupsRendus: 0),
    Parcours(numTrou: 02, parTrou: 4, HCP: 1, advice: "", holeBG: "Hole2", holeGreen: "Green2",DistBlanc: 343, DistJaune: 343, DistBleu: 314, DistRouge: 314, Greenprof: 37, entréeGreen: entréeDeGreen[1], sortieGreen: sortieDeGreen[1], youtubeID: "grhY_v5Vj3w", coupsRendus: 0),
    Parcours(numTrou: 03, parTrou: 3, HCP: 17, advice: "", holeBG: "Hole3", holeGreen: "Green3",DistBlanc: 108, DistJaune: 108, DistBleu: 95, DistRouge: 91, Greenprof: 19, entréeGreen: entréeDeGreen[2], sortieGreen: sortieDeGreen[2], youtubeID: "yMAiIV8UnSY", coupsRendus: 0),
    Parcours(numTrou: 04, parTrou: 4, HCP: 11, advice: "", holeBG: "Hole4", holeGreen: "Green4",DistBlanc: 346, DistJaune: 301, DistBleu: 295, DistRouge: 274, Greenprof: 25, entréeGreen: entréeDeGreen[3], sortieGreen: sortieDeGreen[3], youtubeID: "pUcczUdEbL8", coupsRendus: 0),
    Parcours(numTrou: 05, parTrou: 4, HCP: 3, advice: "", holeBG: "Hole5", holeGreen: "Green5",DistBlanc: 301, DistJaune: 278, DistBleu: 267, DistRouge: 256, Greenprof: 22, entréeGreen: entréeDeGreen[4], sortieGreen: sortieDeGreen[4], youtubeID: "yjQuEQoR1z8", coupsRendus: 0),
    Parcours(numTrou: 06, parTrou: 5, HCP: 9, advice: "", holeBG: "Hole6", holeGreen: "Green6",DistBlanc: 448, DistJaune: 430, DistBleu: 412, DistRouge: 394, Greenprof: 28, entréeGreen: entréeDeGreen[5], sortieGreen: sortieDeGreen[5], youtubeID: "p3f9flqIwp4", coupsRendus: 0),
    Parcours(numTrou: 7, parTrou: 4, HCP: 13, advice: "", holeBG: "Hole7", holeGreen: "Green7",DistBlanc: 290, DistJaune: 260, DistBleu: 225, DistRouge: 222, Greenprof: 16,entréeGreen: entréeDeGreen[6], sortieGreen: sortieDeGreen[6], youtubeID: "nNZABm-Angs", coupsRendus: 0),
    Parcours(numTrou: 08, parTrou: 5, HCP: 5, advice: "", holeBG: "Hole8", holeGreen: "Green8",DistBlanc: 447, DistJaune: 429, DistBleu: 385, DistRouge: 380, Greenprof: 26, entréeGreen: entréeDeGreen[7], sortieGreen: sortieDeGreen[7], youtubeID: "Yiq96TihbgA", coupsRendus: 0),
    Parcours(numTrou: 09, parTrou: 4, HCP: 7, advice: "", holeBG: "Hole9", holeGreen: "Green9",DistBlanc: 347, DistJaune: 330, DistBleu: 278, DistRouge: 272, Greenprof: 28, entréeGreen: entréeDeGreen[8], sortieGreen: sortieDeGreen[8], youtubeID: "cdPsusP8Eeo", coupsRendus: 0),
    Parcours(numTrou: 10, parTrou: 5, HCP: 8, advice: "", holeBG: "Hole10", holeGreen: "Green10",DistBlanc: 490, DistJaune: 456, DistBleu: 436, DistRouge: 408, Greenprof: 23, entréeGreen: entréeDeGreen[9], sortieGreen: sortieDeGreen[9], youtubeID: "E2-dtdOl3FA", coupsRendus: 0),
    Parcours(numTrou: 11, parTrou: 4, HCP: 10, advice: "", holeBG: "Hole11", holeGreen: "Green11",DistBlanc: 317, DistJaune: 282, DistBleu: 268, DistRouge: 234,Greenprof: 16, entréeGreen: entréeDeGreen[10], sortieGreen: sortieDeGreen[10], youtubeID: "1NcFj3FVYc", coupsRendus: 0),
    Parcours(numTrou: 12, parTrou: 4, HCP: 4, advice: "", holeBG: "Hole12", holeGreen: "Green12",DistBlanc: 390, DistJaune: 364, DistBleu: 344, DistRouge: 304, Greenprof: 20, entréeGreen: entréeDeGreen[11], sortieGreen: sortieDeGreen[11], youtubeID: "DeGl35yjU6Q", coupsRendus: 0),
    Parcours(numTrou: 13, parTrou: 3, HCP: 16, advice: "", holeBG: "Hole13", holeGreen: "Green13",DistBlanc: 178, DistJaune: 165, DistBleu: 149, DistRouge: 130, Greenprof: 26, entréeGreen: entréeDeGreen[12], sortieGreen: sortieDeGreen[12], youtubeID: "OvmXtjbQUyU", coupsRendus: 0),
    Parcours(numTrou: 14, parTrou: 4, HCP: 12, advice: "", holeBG: "Hole14", holeGreen: "Green14",DistBlanc: 268, DistJaune: 255, DistBleu: 202, DistRouge: 202, Greenprof: 18, entréeGreen: entréeDeGreen[13], sortieGreen: sortieDeGreen[13], youtubeID: "MSkWd3LFVlk", coupsRendus: 0),
    Parcours(numTrou: 15, parTrou: 4, HCP: 18, advice: "", holeBG: "Hole15", holeGreen: "Green15",DistBlanc: 260, DistJaune: 254, DistBleu: 234, DistRouge: 230, Greenprof: 30, entréeGreen: entréeDeGreen[14], sortieGreen: sortieDeGreen[14], youtubeID: "DJ_iqk4Q3Bg", coupsRendus: 0),
    Parcours(numTrou: 16, parTrou: 4, HCP: 2, advice: "", holeBG: "Hole16", holeGreen: "Green16",DistBlanc: 302, DistJaune: 297, DistBleu: 243, DistRouge: 243, Greenprof: 23, entréeGreen: entréeDeGreen[15], sortieGreen: sortieDeGreen[15], youtubeID: "uMGnDxFrDvw", coupsRendus: 0),
    Parcours(numTrou: 17, parTrou: 4, HCP: 6, advice: "", holeBG: "Hole17", holeGreen: "Green17",DistBlanc: 372, DistJaune: 358, DistBleu: 329, DistRouge: 294, Greenprof: 27, entréeGreen: entréeDeGreen[16], sortieGreen: sortieDeGreen[16], youtubeID: "ficFiSEms5E", coupsRendus: 0),
    Parcours(numTrou: 18, parTrou: 3, HCP: 14, advice: "", holeBG: "Hole18", holeGreen: "Green18",DistBlanc: 165, DistJaune: 151, DistBleu: 131, DistRouge: 127,Greenprof: 20, entréeGreen: entréeDeGreen[17], sortieGreen: sortieDeGreen[17], youtubeID: "ibQsNq_DiQ", coupsRendus: 0)
]
