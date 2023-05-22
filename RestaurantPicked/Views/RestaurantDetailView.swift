//
//  Result.swift
//  RestaurantPicked
//
//  Created by Sejin on 2023/05/12.
//

import UIKit
import MapKit

class RestaurantDetailView: UIView {
    
    // MARK: - UI
    
    let restaurantNameLabel: UILabel = {
        let label = UILabel()
//        label.text = "TEST"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let mapView: MKMapView = {
        let mv = MKMapView()
        mv.isZoomEnabled = true  // 줌 가능 여부
        mv.isScrollEnabled = true  // 이동 가능 여부
        mv.isPitchEnabled = true  // 각도 조절 가능 여부 (두 손가락으로 위/아래 슬라이드)
        mv.isPitchEnabled = true  // 회전 가능 여부
        mv.showsCompass = true  // 나침판 표시 여부
        mv.showsScale = true  // 축척 정보 표시 여부
//        mv.showsUserLocation = true
//        mv.setUserTrackingMode(.followWithHeading, animated: true)
        mv.translatesAutoresizingMaskIntoConstraints = false
        return mv
    }()
    
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Helpers Functions
    
    private func configureUI() {
        self.backgroundColor = .white
        self.addSubview(restaurantNameLabel)
        self.addSubview(mapView)
        
        // AutoLayout
        NSLayoutConstraint.activate([
            restaurantNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            restaurantNameLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            restaurantNameLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            restaurantNameLabel.heightAnchor.constraint(equalToConstant: ("1" as NSString).size(withAttributes: [NSAttributedString.Key.font : restaurantNameLabel.font as Any]).height), // 일단 테스트용
            
            mapView.topAnchor.constraint(equalTo: restaurantNameLabel.bottomAnchor, constant: 10),
            mapView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
}
