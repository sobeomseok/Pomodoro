//
//  WaitingListViewCell.swift
//  Pomodoro
//
//  Created by 소범석 on 2022/11/15.
//

import UIKit

final class WaitingListViewCell: UITableViewCell {
 
    static let identifier = "waitingListCell"

    // MARK: - Properties
    
    // Image
    private let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "squareshape")
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // WaitingList
    private let waitingListNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = .gray
        label.text = "자기 계발"
        label.numberOfLines = 1
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 19)
        label.textColor = .gray
        label.text = "25분 / 5분"
        label.numberOfLines = 1
        return label
    }()
    
//    private var runtimeLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.systemFont(ofSize: 17)
//        return label
//    }()
//
//    private var downtimeLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.systemFont(ofSize: 17)
//        return label
//    }()
    
    // Times
    private var timesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 19)
        label.textColor = .gray
        label.textAlignment = .right
        label.text = "6회"
        label.numberOfLines = 1
        return label
    }()
    
    // StackView
    private lazy var waitingListVStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [waitingListNameLabel, timeLabel])
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.spacing = -20
        return sv
    }()
    
    private lazy var HStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [mainImageView, waitingListVStackView, timesLabel])
        sv.axis = .horizontal
        sv.spacing = 30
        return sv
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // HStackView
        contentView.addSubview(HStackView)
        HStackView.anchor(left: contentView.leadingAnchor, paddingLeft: 0)
        
        HStackView.addArrangedSubview(mainImageView)
        mainImageView.anchor(left: contentView.leadingAnchor, paddingLeft: 0, width: 80, height: 80)
        mainImageView.centerY(inView: contentView)
        
        HStackView.addArrangedSubview(waitingListVStackView)
        
        HStackView.addArrangedSubview(timesLabel)
        timesLabel.anchor(top: contentView.topAnchor, bottom: contentView.bottomAnchor, right: contentView.trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingRight: 20)
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
