//
//  HalfRandom.swift
//  RestaurantPicked
//
//  Created by Sejin on 2023/05/12.
//

import UIKit

class HalfRandomButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        halfRandomBtnCustom()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        halfRandomBtnCustom()
    }
    
    private func halfRandomBtnCustom() {
        
        let buttonSize: CGFloat = 127.0
        
        self.layer.cornerRadius = buttonSize / 2
        self.clipsToBounds = true
        
        self.backgroundColor = UIColor(red: 50.0/255.0, green: 50.0/255.0, blue: 50.0/255.0, alpha: 1.0)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        self.setTitleColor(.white, for: .normal)
    }
}
