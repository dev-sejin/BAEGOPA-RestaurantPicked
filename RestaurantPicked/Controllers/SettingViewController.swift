//
//  InfoViewController.swift
//  RestaurantPicked
//
//  Created by Doyoung An on 2023/05/18.
//

import UIKit

final class SettingViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
    }
    
    // 화면이 나타날때 tabbar 숨기기
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.tabBar.isHidden = true
    }
    
    // 화면이 사라질때 다시 tabbar 나타나기
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        tabBarController?.tabBar.isHidden = false
    }
    
    
    // MARK: - Helpers Functions
    
    // MARK: - Selectors
    
    // MARK: - Actions
    
    
}


// MARK: - Extension

