//
//  WatingListViewCell.swift
//  Pomodoro
//
//  Created by 소범석 on 2022/11/14.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    private let thumbnailImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .systemBlue
        return image
    }()
    
    private let teacherNameLabel: UILabel = {
        let label = UILabel()
        label.text = "뽀모도로 가즈앗!"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    
    private let lectureLabel: UILabel = {
        let label = UILabel()
        label.text = "What seaweed and cowburps have to do with climate action"
        label.textColor = .white
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setLayout() {
        addSubview(thumbnailImage)
        thumbnailImage.centerY(inView: self)
        thumbnailImage.anchor(left: self.leadingAnchor, paddingLeft: 20,width: 160,height: 90)
        
        addSubview(teacherNameLabel)
        teacherNameLabel.anchor(top: thumbnailImage.topAnchor,left: thumbnailImage.trailingAnchor,right: self.trailingAnchor,paddingTop:5 ,paddingLeft: 20,paddingRight: 20)
        
        addSubview(lectureLabel)
        lectureLabel.anchor(left: thumbnailImage.trailingAnchor,bottom: thumbnailImage.bottomAnchor,right: self.trailingAnchor,paddingLeft: 20,paddingBottom: 5,paddingRight: 20)
    }
}
