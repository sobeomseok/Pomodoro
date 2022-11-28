//
//  HomeWaitngListViewCell.swift
//  Pomodoro
//
//  Created by 소범석 on 2022/11/25.
//

import UIKit

final class HomeWaitngListViewCell: UITableViewCell {
 
    static let identifier = "homeWaitingListCell"

    // MARK: - Properties
    
    private let waitingListNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .gray
        label.textAlignment = .center
        label.text = "자기 계발"
        label.numberOfLines = 1
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .gray
        label.textAlignment = .center
        label.text = "25분 / 5분"
        label.numberOfLines = 1
        return label
    }()
    
    private var timesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .gray
        label.textAlignment = .center
        label.text = "6회"
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var HStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [waitingListNameLabel, timeLabel, timesLabel])
        sv.axis = .horizontal
        sv.distribution = .fillEqually
//        sv.spacing = 30
        return sv
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(HStackView)
        HStackView.anchor(top: contentView.topAnchor, left: contentView.leadingAnchor, bottom: contentView.bottomAnchor, right: contentView.trailingAnchor,
                          paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        changeTimeLabel()
        configure()
        
        super.updateConstraints()
    }
    
    // MARK: - Selectors
    
    // MARK: - API
    
    // MARK: - Helpers
    
    func configure() {
        
    }
    
    func configureUI() {
        
    }
    
    func changeTimeLabel() {
//        guard let runtimeText = runtimeLabel.text else { return }
//        guard let downtimeText = downtimeLabel.text else { return }
//
//        let attributeString = NSAttributedString
    }
    
}
