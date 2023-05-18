//
//  HalfRandom.swift
//  RestaurantPicked
//
//  Created by Sejin on 2023/05/12.
//

import UIKit

class HalfRandomView: UIView {
    
    // MARK: - UI
    
    // random button 생성
    let koreanButton = CircularButton(title: "Korean")
    let chinessButton = CircularButton(title: "Chiness")
    let japaneseButton = CircularButton(title: "Japanesse")
    let westernButton = CircularButton(title: "Western")
    let cafeButton = CircularButton(title: "Cafe")
    let barButton = CircularButton(title: "Bar")
    
    
    // MARK: - Initializer
    
    // Interface Builder에서 쓰이지 않고, 코드로 (Programmatically) UIView를 상속받은 클래스를 만들 때 사용
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    // Interface Builder에서 생성되는 초기화 구문
    // 지정 생성자를 재정의 할 경우 필수 생성자를 반듯이 구현 해야 한다.
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Helpers Functions
    
    private func configureUI() {
        self.backgroundColor = .white
        configuareStacView()
    }
    
    private func configuareStacView() {
        let topStack = CustomStackView(arrangedSubviews: [koreanButton, chinessButton])
        let middleStack = CustomStackView(arrangedSubviews: [japaneseButton, westernButton])
        let bottomStack = CustomStackView(arrangedSubviews: [cafeButton, barButton])
        let allStack = UIStackView(arrangedSubviews: [topStack, middleStack, bottomStack])
        
        allStack.axis = .vertical
        allStack.spacing = 30
        allStack.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(allStack)
        
        // autolayout
        NSLayoutConstraint.activate([
            allStack.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            allStack.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
    
}
