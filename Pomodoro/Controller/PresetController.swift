//
//  TimerController.swift
//  Pomodoro
//
//  Created by 소범석 on 2022/10/19.
//

import UIKit

class PresetController: UIViewController {
    
    // MARK: - Properties
    
    private let titleView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "프리셋"
        label.textColor = .darkGray
        label.font = .boldSystemFont(ofSize: 45)
        return label
    }()
    
    private lazy var plusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        button.tintColor = .systemBlue
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 45), forImageIn: .normal)
        button.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // UICollectionView
    private let collectionView: UICollectionView = {
        let flowlayout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        view.backgroundColor = .systemBackground
        configureUI()
    }
    
    private func configureUI() {
        navigationController?.navigationBar.isHidden = true
        
        // Title
        view.addSubview(titleView)
        titleView.anchor(top:view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, right: view.trailingAnchor, paddingLeft: 35, paddingRight: 35, height: 110)
        
        titleView.addSubview(titleLabel)
        titleLabel.centerY(inView: titleView)
        titleLabel.anchor(left: titleView.leadingAnchor, paddingLeft: 0)
        
        titleView.addSubview(plusButton)
        plusButton.centerY(inView: titleView)
        plusButton.anchor(right: titleView.trailingAnchor, paddingRight: 0)
        
        // Preset
        view.addSubview(collectionView)
        collectionView.anchor(top: titleView.bottomAnchor, left: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.trailingAnchor)
        
        collectionView.register(PresetViewCell.self, forCellWithReuseIdentifier: PresetViewCell.identifier)
        
    }
    // MARK: - Selectors

    @objc func plusButtonTapped() {
        print("DEBUG: button Tapped")
    }
}

    // MARK: - Lifecycle


    // MARK: - API

    // MARK: - Helpers


// MARK: - UICollectionViewDataSource
extension PresetController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PresetViewCell.identifier, for: indexPath) as! PresetViewCell
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension PresetController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension PresetController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width - 80) / 2, height: (view.frame.width - 80) / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
    }
}
