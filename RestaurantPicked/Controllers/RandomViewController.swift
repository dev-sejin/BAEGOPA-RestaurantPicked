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
                  let random = self.searchLocationAPI.getRandomLocation(),
                  let coordinate = self.searchLocationAPI.getRandomLocationCoordinate(),
                  let url = self.searchLocationAPI.getRandomLocationWebViewURLString()
            else { return }
            print("검색 결과: \(result)\n----------")
            print("랜덤장소: \(random.title)\n----------")
            print("랜덤 장소 좌표: \(coordinate)\n----------")
            print("WebView URL: \(url)\n----------")
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
