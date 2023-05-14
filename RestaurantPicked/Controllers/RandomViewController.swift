//
//  ViewController.swift
//  RestaurantPicked
//
//  Created by Sejin on 2023/05/12.
//

import UIKit

final class RandomViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        testSearchLocationAPI()
    }
    
    // SearchLocationAPI 테스트용
    func testSearchLocationAPI() {
        SearchLocationAPI.shared.requestLocation(searchQuery: "서울특별시 강남 맛집") { print($0) }
    }
}

// alamofire
// snapkit
