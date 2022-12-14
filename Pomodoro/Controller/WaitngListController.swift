//
//  WaitngListController.swift
//  Pomodoro
//
//  Created by 소범석 on 2022/11/10.
//

import UIKit

class WaitingListController: UIViewController {
    // MARK: - Properties
    
    var waitingListArray: [WaitingList] = []
    
    var waitingListData = WaitingListViewModel()
    
    private let tableView = UITableView()
    
    private let titleView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "대기목록"
        label.textColor = .darkGray
        label.font = .boldSystemFont(ofSize: 45)
        return label
    }()
    
//    private let plusButton: UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
//        button.tintColor = .systemBlue
//        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 45), forImageIn: .normal)
//        button.addTarget(WaitingListController.self, action: #selector(plusButtonTap), for: .touchUpInside)
//        return button
//    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
        setupTableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    // MARK: - Selectors
    
//    @objc func plusButtonTap() {
//        print("DEBUG: button Tapped")
//    }

    @objc func plusButtonTap() {
        print("DEBUG: button tap")
    }
    //MARK: - Helpers

    private func configureUI() {
        navigationController?.navigationBar.isHidden = true
        // Title View Autolayout
        view.addSubview(titleView)
        titleView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, right: view.trailingAnchor, height: 110)
        
        titleView.addSubview(titleLabel)
        titleLabel.centerY(inView: titleView)
        titleLabel.anchor(left: titleView.leadingAnchor, paddingLeft: 35)
        
        // TableView Autolayout
        view.addSubview(tableView)
        tableView.anchor(top: titleView.bottomAnchor, left: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.trailingAnchor,
                         paddingTop: 0, paddingLeft: 35, paddingBottom: 0, paddingRight: 35)
        
    }
    
    // TableView Setting
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.rowHeight = 90
        tableView.register(WaitingListViewCell.self, forCellReuseIdentifier: WaitingListViewCell.identifier)
        tableView.register(WaitingListFooterView.self, forHeaderFooterViewReuseIdentifier: WaitingListFooterView.identifier)
        // Temporary Data
        waitingListData.makeWaitingListData()
        waitingListArray = waitingListData.getWaitingListData()
    }
    
    // FooterView
//    func getFooterView() -> UIView {
//        let footer = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.size.width, height: self.tableView.frame.size.height))
//        footer.backgroundColor = .systemYellow
//        // Footer Button
//        let button = UIButton()
//        button.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
//        button.tintColor = .systemBlue
//        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 45), forImageIn: .normal)
//        button.addTarget(WaitingListController.self, action: #selector(plusButtonTapped), for: .touchUpInside)
//        button.center = footer.center
//
//        footer.bringSubviewToFront(button)
//        return footer
//    }

}
//MARK: - UITableViewDataSource

extension WaitingListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return waitingListArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WaitingListViewCell.identifier, for: indexPath) as! WaitingListViewCell
        return cell
    }
}

//MARK: - UITableViewDelegate

extension WaitingListController: UITableViewDelegate {
    // Footer View
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: WaitingListFooterView.identifier)
        return footer
    }
    // Footer Height
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 90
    }
}


