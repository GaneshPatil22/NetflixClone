//
//  ViewController.swift
//  Netflix Clone
//
//  Created by Patil, Ganesh on 20/08/22.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .systemYellow
        self.initAllVC()
    }

    private func initAllVC() {
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let upcommingVC = UINavigationController(rootViewController: UpcommingViewController())
        let searchVC = UINavigationController(rootViewController: SearchViewController())
        let downloadVC = UINavigationController(rootViewController: DownloadViewController ())

        homeVC.tabBarItem.image = UIImage(systemName: "house")
        upcommingVC.tabBarItem.image = UIImage(systemName: "play.circle")
        searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        downloadVC.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")

        homeVC.title = "Home"
        upcommingVC.title = "Comming Soon"
        searchVC.title = "Top Search"
        downloadVC.title = " Downloads"

        tabBar.tintColor = .label

        self.setViewControllers([homeVC, upcommingVC, searchVC, downloadVC], animated: true )
    }

}

