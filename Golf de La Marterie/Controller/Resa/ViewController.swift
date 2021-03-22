//
//  ViewController.swift
//  Golf de La Marterie
//
//  Created by Guillaume Roy on 25/01/2021.
//

import UIKit
import FSCalendar

class ViewController: UIViewController, FSCalendarDelegate {
    @IBOutlet weak var calendar: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.delegate = self
        calendar.locale = NSLocale(localeIdentifier: "fr_FR") as Locale
        
    }


}



