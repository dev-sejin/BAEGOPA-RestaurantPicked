//
//  RestaurantDetailViewController.swift
//  RestaurantPicked
//
//  Created by Sejin on 2023/05/15.
//

import UIKit
import SnapKit
import CoreLocation
import MapKit


class RestaurantDetailViewController: UITabBarController, CLLocationManagerDelegate {
    
    let restaurantLabel = UILabel()
    let mapView = MKMapView()
    
    var locationManager = CLLocationManager()
    var selectedCategory: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            print("위치 서비스 On 상태")
            locationManager.startUpdatingLocation()
            print(locationManager.location?.coordinate)
        } else {
            print("위치 서비스 Off 상태")
        }
        
        setupViews()
        
    }
    
    // 위도 경도 받아오기 에러
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    private func setupViews() {
        self.view.addSubview(restaurantLabel)
        self.view.addSubview(mapView)
    
        restaurantLabel.text = "RestaurantName"
    
        restaurantLabel.snp.makeConstraints { make in
                make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(20)
                make.centerX.equalToSuperview()
            }
        
        mapView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(300)
        }
    }
    
    // 맵 위치 업데이트
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let region = MKCoordinateRegion.init(center: center, latitudinalMeters: 1000, longitudinalMeters: 1000)
            self.mapView.setRegion(region, animated: true)

            // 현재 위치에 마커 추가
            let annotation = MKPointAnnotation()
            annotation.coordinate = center
            annotation.title = "현재 위치"
            mapView.addAnnotation(annotation)
        }
    }

}
