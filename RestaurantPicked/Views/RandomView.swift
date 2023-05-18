//
//  Random.swift
//  RestaurantPicked
//
//  Created by Sejin on 2023/05/12.
//

import UIKit

class RandomView: UIView {
    
    // MARK: - UI
    
    // random button 생성
    let randomButton = CircularButton(title: "Random")
    
    
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
        self.addSubview(randomButton)
        
        // AutoLauyout
        NSLayoutConstraint.activate([
            randomButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            randomButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
}
