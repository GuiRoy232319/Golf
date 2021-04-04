//
//  ScorePickerViewToolbar.swift
//  Golf de La Marterie
//
//  Created by Guillaume Roy on 30/03/2021.
//

import Foundation
import UIKit

protocol ScoreToolBarPickerViewDelegate: class{
    func didTapSave()
    func didTapCancel()
    func didSelect(_ pickerView: UIPickerView, didSelectItemAtIndexPath: IndexPath)
}

class ScoreToolbarPickerView: UIPickerView{
    public private(set) var toolbar : UIToolbar?
    public weak var toolbarDelegate: ScoreToolBarPickerViewDelegate?
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }

    private func commonInit() {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = .black
        toolBar.sizeToFit()

        let doneButton = UIBarButtonItem(title: "Sauvegarder", style: .plain, target: self, action: #selector(self.doneTapped))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Annuler", style: .plain, target: self, action: #selector(self.cancelTapped))

        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true

        self.toolbar = toolBar
    }

    @objc func doneTapped() {
        self.toolbarDelegate?.didTapSave()
    }

    @objc func cancelTapped() {
        self.toolbarDelegate?.didTapCancel()
    }
}


