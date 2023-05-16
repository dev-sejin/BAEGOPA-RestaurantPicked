//
//  ViewController.swift
//  RestaurantPicked
//
//  Created by Sejin on 2023/05/12.
//

import UIKit

final class RandomViewController: UIViewController {
    
    private let searchLocationAPI = SearchLocationAPI.shared
    
    let randomButton = RandomButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        testSearchLocationAPI()
        
        
        setupButton()
        setupButtonConstraints()
        
    }

    // SearchLocationAPI 테스트용
    func testSearchLocationAPI() {
        searchLocationAPI.requestLocation(searchQuery: "서울특별시 강남 맛집") { _ in
            guard let result = self.searchLocationAPI.getSearchResult(),
                  let random = self.searchLocationAPI.getRandomPlace() else { return }
            print(result)
            print(random)
        }
    }
    
    private func setupButton() {
        self.view.addSubview(randomButton)
        
        randomButton.setTitle("RANDOM", for: .normal)
        randomButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        let restaurantDetailView = RestaurantDetailViewController()
        self.navigationController?.pushViewController(restaurantDetailView, animated: true)
    }
    
    
    private func setupButtonConstraints() {
        randomButton.snp.makeConstraints { make in
            let buttonSize: CGFloat = 180.0
            make.width.height.equalTo(buttonSize)
            make.center.equalToSuperview()
        }
    }
}

// alamofire
// snapkit
