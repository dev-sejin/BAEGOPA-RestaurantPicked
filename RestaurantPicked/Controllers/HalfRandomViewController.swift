//
//  HalfRandomViewController.swift
//  RestaurantPicked
//
//  Created by Sejin on 2023/05/15.
//

import UIKit

class HalfRandomViewController: UIViewController {
    
    
    let category: [String] = ["KOREAN", "CHINESE", "JAPANESE", "WESTERN", "CAFE", "BAR"]
    var buttons = [String: HalfRandomButton]()
    
    let buttonSize: CGFloat = 127
    let sideMargin: CGFloat = 36
    let gap: CGFloat = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        setupButtons()
        setupButtonConstraints()
    }
    
    
    private func setupButtons() {
        for categoryName in category {
            let button = HalfRandomButton()
            button.setTitle(categoryName, for: .normal)
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            self.view.addSubview(button)
            buttons[categoryName] = button
        }
    }
    
    @objc private func buttonTapped(_ sender: HalfRandomButton) {
        let restaurantDetailView = RestaurantDetailViewController()
        restaurantDetailView.selectedCategory = sender.titleLabel?.text
        self.navigationController?.pushViewController(restaurantDetailView, animated: true)
    }
    
    
    private func setupButtonConstraints() {
        if let koreanBtn = buttons["KOREAN"],
           let chineseBtn = buttons["CHINESE"],
           let japaneseBtn = buttons["JAPANESE"],
           let westernBtn = buttons["WESTERN"],
           let cafeBtn = buttons["CAFE"],
           let barBtn = buttons["BAR"] {
            
            koreanBtn.snp.makeConstraints { make in
                make.centerX.equalToSuperview().multipliedBy(0.5).offset(sideMargin / 2)
                make.centerY.equalToSuperview().offset(-(buttonSize / 2 + gap))
                make.width.height.equalTo(buttonSize)
            }
            
            chineseBtn.snp.makeConstraints { make in
                make.centerX.equalToSuperview().multipliedBy(1.5).offset(-sideMargin / 2)
                make.centerY.equalToSuperview().offset(-(buttonSize / 2 + gap))
                make.width.height.equalTo(buttonSize)
            }
            
            japaneseBtn.snp.makeConstraints { make in
                make.centerX.equalToSuperview().multipliedBy(0.5).offset(sideMargin / 2)
                make.centerY.equalToSuperview()
                make.width.height.equalTo(buttonSize)
            }
            
            westernBtn.snp.makeConstraints { make in
                make.centerX.equalToSuperview().multipliedBy(1.5).offset(-sideMargin / 2)
                make.centerY.equalToSuperview()
                make.width.height.equalTo(buttonSize)
            }
            
            cafeBtn.snp.makeConstraints { make in
                make.centerX.equalToSuperview().multipliedBy(0.5).offset(sideMargin / 2)
                make.centerY.equalToSuperview().offset(buttonSize / 2 + gap)
                make.width.height.equalTo(buttonSize)
            }
            
            barBtn.snp.makeConstraints { make in
                make.centerX.equalToSuperview().multipliedBy(1.5).offset(-sideMargin / 2)
                make.centerY.equalToSuperview().offset(buttonSize / 2 + gap)
                make.width.height.equalTo(buttonSize)
            }
        }
    }
}
