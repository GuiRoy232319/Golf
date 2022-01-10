//
//  ToolBarPickerView.swift
//  Golf de La Marterie
//
//  Created by Guillaume Roy on 02/02/2021.
//

import Foundation
import UIKit

protocol ToolbarPickerViewDelegate: AnyObject {
    func didTapDone()
    func didTapSave()
}
class ToolbarPickerView: UIPickerView {

    public private(set) var toolbar: UIToolbar?
    public weak var toolbarDelegate: ToolbarPickerViewDelegate?

    override init(frame: CGRect) {
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
        let cancelButton = UIBarButtonItem(title: "Terminer la Partie", style: .plain, target: self, action: #selector(self.saveTapped))
        toolBar.setItems([doneButton, spaceButton, cancelButton], animated: false)
        toolBar.isUserInteractionEnabled = true

        self.toolbar = toolBar
    }

    @objc func doneTapped() {
        self.toolbarDelegate?.didTapDone()
    }
    @objc func saveTapped() {
        self.toolbarDelegate?.didTapSave()
        }
}
