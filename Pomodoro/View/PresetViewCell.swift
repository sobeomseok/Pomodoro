//
//  WatingListViewCell.swift
//  Pomodoro
//
//  Created by 소범석 on 2022/11/14.
//

import UIKit

class PresetViewCell: UICollectionViewCell {
    
    static let identifier = "PresetCell"
    
    // MARK: - Properties
    // Label
    private let PresetNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = .gray
        label.text = "공부"
        label.numberOfLines = 1
        return label
    }()
    
    private let PresetTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .gray
        label.text = "25분 / 5회  6회"
        label.numberOfLines = 1
        return label
    }()
    
    // Button
    private let plusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        button.tintColor = .systemBlue
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 30), forImageIn: .normal)
        button.addTarget(PresetViewCell.self, action: #selector(plusButtonClicked), for: .touchUpInside)
        return button
    }()
    
    private let editButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "ellipsis.circle.fill"), for: .normal)
        button.tintColor = .systemBlue
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 30), forImageIn: .normal)
        button.addTarget(PresetViewCell.self, action: #selector(editButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // Stack View
    private lazy var settingStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [plusButton, editButton])
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = -20
        return sv
    }()
    
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBackground
        contentView.layer.cornerRadius = 10
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.gray.cgColor
        contentView.layer.masksToBounds = true
        
        contentView.addSubview(PresetNameLabel)
        PresetNameLabel.anchor(top: contentView.topAnchor, left: contentView.leadingAnchor, paddingTop: 20, paddingLeft: 10)
        
        contentView.addSubview(PresetTimeLabel)
        PresetTimeLabel.anchor(left: contentView.leadingAnchor, paddingLeft: 10)
        PresetTimeLabel.centerY(inView: contentView)
        
        contentView.addSubview(settingStackView)
        settingStackView.anchor(left: contentView.leadingAnchor, bottom: contentView.bottomAnchor, right: contentView.trailingAnchor, paddingLeft: 0, paddingBottom: 20, paddingRight: 0)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    @objc func plusButtonClicked() {
        print("button Tapped")
    }
    
    @objc func editButtonTapped() {
        print("button Tapped")
    }
    
    // MARK: - API
    
    // MARK: - Helpers
    
}
