//
//  Random.swift
//  RestaurantPicked
//
//  Created by Sejin on 2023/05/12.
//

import UIKit

class RandomButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        randomBtnCustom()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        randomBtnCustom()
    }
    
    private func randomBtnCustom() {
        
        let buttonSize: CGFloat = 180.0
        
        self.layer.cornerRadius = buttonSize / 2
        self.clipsToBounds = true
        
        self.backgroundColor = UIColor(red: 50.0/255.0, green: 50.0/255.0, blue: 50.0/255.0, alpha: 1.0)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        self.setTitleColor(.white, for: .normal)
    }
    
    
}
