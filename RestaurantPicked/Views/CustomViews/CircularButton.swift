//
//  CircularButton.swift
//  RestaurantPicked
//
//  Created by Doyoung An on 2023/05/18.
//

import UIKit

class CircularButton: UIButton {
    
    // MARK: - Initializer
    
    // Interface Builder에서 쓰이지 않고, 코드로 (Programmatically) UIView를 상속받은 클래스를 만들 때 사용
    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setupCircularButtonUI()
    }
    
    // Interface Builder에서 생성되는 초기화 구문
    // 지정 생성자를 재정의 할 경우 필수 생성자를 반듯이 구현 해야 한다.
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Helpers Functions
    
    func setupCircularButtonUI() {
        // button 기본 UI 설정
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        setTitleColor(.white, for: .normal)
        backgroundColor = .black
        layer.borderColor = UIColor.black.cgColor
        
        // button 원형으로 설정
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant:150 ),
            heightAnchor.constraint(equalToConstant: 150)
        ])
        
        // button 그림자 설정
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero  //(width: 10, height: 10)
        layer.shadowRadius = 20
        layer.masksToBounds = false
    }
    
    
    // MARK: - Drawing Cycle (Layout Cycle)
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // button 원형으로 설정
        layer.cornerRadius = bounds.size.width * 0.5
        clipsToBounds = true
    }
    
}
