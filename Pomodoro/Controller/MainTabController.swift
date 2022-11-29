//
//  MainTabController.swift
//  Pomodoro
//
//  Created by 소범석 on 2022/10/19.
//
import UIKit
import AudioToolbox

enum TimerStatus {
    case start
    case pause
    case end
}

class MainTabController: UITabBarController {
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
      navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewControllers()
        
    }
    
    // MARK: - Helpers
    func configureViewControllers() {
        let home = HomeController()
        let nav1 = templateNavigationController(image: UIImage(systemName: "house"), title: "홈", rootViewController: home)
       
//        let waitingList = WaitingListController()
//        let nav2 = templateNavigationController(image: UIImage(systemName: "list.bullet.rectangle.portrait"), title: "대기목록", rootViewController: waitingList)
        
        let preset = PresetController()
        let nav2 = templateNavigationController(image: UIImage(systemName: "highlighter"), title: "프리셋", rootViewController: preset)

        viewControllers = [nav1, nav2]
    }
    
    func templateNavigationController(image: UIImage?, title: String?, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        nav.navigationBar.tintColor = .red
        nav.title = title
        nav.navigationBar.barTintColor = .white
        return nav
    }
    
    // MARK: - Selectors

    // MARK: - API

    

   

}



