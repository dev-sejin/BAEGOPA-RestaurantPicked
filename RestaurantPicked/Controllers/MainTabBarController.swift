//
//  MainTabBarController.swift
//  RestaurantPicked
//
//  Created by Sejin on 2023/05/15.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let randomVC = RandomViewController()
        let randomNavVC = UINavigationController(rootViewController: randomVC)
//        randomVC.tabBarItem = UITabBarItem(title: "진짜 랜덤", image: UIImage(named: "Random"), tag: 0)
        
        let halfRandomVC = HalfRandomViewController()
        let halfRandomNavVC = UINavigationController(rootViewController: halfRandomVC)
//        halfRandomVC.tabBarItem = UITabBarItem(title: "반쪽 랜덤", image: UIImage(named: "HalfRandom"), tag: 1)
        
        tabBar.backgroundColor = .white
//        tabBar.barTintColor = UIColor.white
        tabBar.tintColor = UIColor(red: 50.0/255.0, green: 50.0/255.0, blue: 50.0/255.0, alpha: 1.0)
        tabBar.unselectedItemTintColor = UIColor(red: 206.0/255.0, green: 206.0/255.0, blue: 208.0/255.0, alpha: 1.0)
        
        //MainTabBarController에 randomNavVC, halfRandomNavVC 네비게이션 컨트롤러 추가
        self.setViewControllers([randomNavVC, halfRandomNavVC], animated: true)

        //탭바의 속성 변경
        if let items = self.tabBar.items {
            items[0].title = "진짜 랜덤"
            items[0].image = UIImage(named: "Random")
            items[0].tag = 0
            
            items[1].title = "반쪽 랜덤"
            items[1].image = UIImage(named: "HalfRandom")
            items[1].tag = 1
        }
    }
    
    
}
