//
//  RestaurantDetailViewController.swift
//  RestaurantPicked
//
//  Created by Sejin on 2023/05/15.
//

import UIKit
import SnapKit
import CoreLocation
import MapKit


class RestaurantDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    var tappedButtonTitle: String = ""
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        print(tappedButtonTitle)
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



