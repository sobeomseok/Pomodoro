//
//  ss.swift
//  Pomodoro
//
//  Created by 소범석 on 2022/11/30.
//

import UIKit

class DatePickerLabel: UILabel {

    private let _inputView: UIView? = {
        let picker = UIPickerView()
        return picker
    }()

    override var inputView: UIView? {
        return _inputView
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(launchPicker))
        self.addGestureRecognizer(tapRecognizer)
    }

    @objc private func launchPicker() {
        becomeFirstResponder()
        print("DEBUG: label Tapped")
    }
}
