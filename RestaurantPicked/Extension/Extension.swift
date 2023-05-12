//
//  Extension.swift
//  RestaurantPicked
//
//  Created by Sejin on 2023/05/12.
//

import Foundation

extension Bundle {
    
    // 생성한 .plist 파일 경로 불러오기
    var LOCATION_ID: String {
        guard let file = self.path(forResource: "APIKEY", ofType: "plist") else { return "" }
        
        // .plist를 딕셔너리로 받아오기
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
        
        // 딕셔너리에서 값 찾기
        guard let key = resource["LocationID"] as? String else {
            fatalError("LocationID error")
        }
        return key
    }
    
    // 생성한 .plist 파일 경로 불러오기
    var LOCATION_PW: String {
        guard let file = self.path(forResource: "APIKEY", ofType: "plist") else { return "" }
        
        // .plist를 딕셔너리로 받아오기
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
        
        // 딕셔너리에서 값 찾기
        guard let key = resource["LocationPW"] as? String else {
            fatalError("LocationPW error")
        }
        return key
    }
    
    // 생성한 .plist 파일 경로 불러오기
    var GEOCODING_ID: String {
        guard let file = self.path(forResource: "APIKEY", ofType: "plist") else { return "" }
        
        // .plist를 딕셔너리로 받아오기
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
        
        // 딕셔너리에서 값 찾기
        guard let key = resource["ReverseGeocodingID"] as? String else {
            fatalError("ReverseGeocodingID error")
        }
        return key
    }
    
    // 생성한 .plist 파일 경로 불러오기
    var GEOCODING_PW: String {
        guard let file = self.path(forResource: "APIKEY", ofType: "plist") else { return "" }
        
        // .plist를 딕셔너리로 받아오기
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
        
        // 딕셔너리에서 값 찾기
        guard let key = resource["ReverseGeocodingPW"] as? String else {
            fatalError("ReverseGeocodingPW error")
        }
        return key
    }
    
}
