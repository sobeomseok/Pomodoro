//
//  ss.swift
//  Pomodoro
//
//  Created by 소범석 on 2022/11/30.
//

import UIKit

class DatePickerLabel: UILabel {

    private let _inputView: UIView? = {
        let picker = UIDatePicker()
        return picker
    }()

    private let _inputAccessoryToolbar: UIToolbar = {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        return toolBar
    }()

    override var inputView: UIView? {
        return _inputView
    }

    override var inputAccessoryView: UIView? {
        return _inputAccessoryToolbar
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)

        _inputAccessoryToolbar.setItems([ spaceButton, doneButton ], animated: false)

        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(launchPicker))
        self.addGestureRecognizer(tapRecognizer)
    }

    override var canBecomeFirstResponder: Bool {
        return true
    }

    @objc private func launchPicker() {
        becomeFirstResponder()
    }

    @objc private func doneClick() {
        resignFirstResponder()
    }

}
