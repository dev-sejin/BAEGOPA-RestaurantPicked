//
//  SelectRestaurantAnnotaion.swift
//  RestaurantPicked
//
//  Created by Doyoung An on 2023/05/18.
//

import MapKit
import Contacts

/*
 MKAnnotation 프로토콜 채택 필수 조건
 1.Class로 선언
 2. MKAnnotation 프로토콜을 채택하기 위해서는 무조건 NSObject 클래스를 상속해야 한다.
 그 이유는 MKAnnotation 프로토콜은 NSObjectProtocol의 한 종류이기 때문
 "Cannot declare conformance to 'NSObjectProtocol' in Swift; 'RestaurantCoord' should inherit 'NSObject' instead"
 
 3. MKAnnotation 프로토콜의 필수채택 속성 존재 (coordinate 속성)
 */

class SelectRestaurantAnnotaion: NSObject, MKAnnotation {
    
    let title: String?
    let locationName: String?
    let discipline: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title: String?, locationName: String?, discipline: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
    
    // 목적지 설정을 위한 mapItem 생성
    var mapItem: MKMapItem? {
        guard let location = locationName else {
            return nil
        }
        
        let addressDict = [CNPostalAddressStreetKey: location]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDict)
        let mapItme = MKMapItem(placemark: placemark)
        mapItme.name = title
        return mapItme
    }
    
}
