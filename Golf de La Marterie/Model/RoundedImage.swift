//
//  RoundedImage.swift
//  Golf de La Marterie
//
//  Created by Guillaume Roy on 22/03/2021.
//

import UIKit

class RoundedImage: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    func setup(){
        layer.cornerRadius = frame.height / 2
        layer.borderColor = UIColor.systemGray2.cgColor
        layer.borderWidth = 2
    }

}
