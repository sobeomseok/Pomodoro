//
//  WaitingListFooterVIew.swift
//  Pomodoro
//
//  Created by 소범석 on 2022/11/18.
//

import UIKit

class WaitingListFooterView: UITableViewHeaderFooterView {
    static let identifier = "tableFooter"
    
    private lazy var plusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        button.tintColor = .systemBlue
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 45), forImageIn: .normal)
        button.addTarget(self, action: #selector(plusButtonClicked), for: .touchUpInside)
        return button
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(plusButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        plusButton.sizeToFit()
        plusButton.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height)
    }
    
    
    @objc func plusButtonClicked() {
        print("DEBUG: button tapped")
    }
    
}
