//
//  ViewController.swift
//  RestaurantPicked
//
//  Created by Sejin on 2023/05/12.
//

import UIKit

class RandomViewController: UIViewController {
    
    // SearchLocationAPI 테스트용
    private let searchLocationAPI = SearchLocationAPI.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        testSearchLocationAPI()
    }
    
    // SearchLocationAPI 테스트용
    func testSearchLocationAPI() {
        searchLocationAPI.requestLocation()
    }
}

// alamofire
// snapkit
