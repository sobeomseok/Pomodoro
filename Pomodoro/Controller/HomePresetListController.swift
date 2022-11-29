//
//  HomeWaitngListController.swift
//  Pomodoro
//
//  Created by 소범석 on 2022/11/14.
//

import UIKit

final class HomePresetListController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.register(HomeWaitngListViewCell.self, forCellReuseIdentifier: HomeWaitngListViewCell.identifier)
        view.delegate = self
        view.dataSource = self
        view.separatorStyle = .none
        return view
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(tableView)
        tableView.anchor(top: view.topAnchor, left: view.leadingAnchor, bottom: view.bottomAnchor, right: view.trailingAnchor)
    }
    
    // MARK: - Selectors
    
    // MARK: - API
    
    // MARK: - Helpers
    
    private func configureUI() {
        
    }
    
    private func setupSheet() {
        
//        if let sheet = sheetPresentationController {
//            sheet.detents = [.medium()]
//            sheet.selectedDetentIdentifier = .medium
//            sheet.prefersScrollingExpandsWhenScrolledToEdge = true
//            sheet.prefersGrabberVisible = true
//            sheet.prefersEdgeAttachedInCompactHeight = true
//        }
    }
}


// MARK: - UITableViewDataSource

extension HomePresetListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeWaitngListViewCell.identifier, for: indexPath)
        return cell
    }
}

// MARK: - UITableViewDelegate

extension HomePresetListController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}


