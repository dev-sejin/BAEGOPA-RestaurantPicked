//
//  SearchLocation.swift
//  RestaurantPicked
//
//  Created by 김민준 on 2023/05/14.
//

import Foundation
// test
/// 네이버 지역 검색 구조체입니다.
struct SearchLocation: Codable {
    
    /// LocationItem 배열
    let items: [LocationItem]
}

/// 네이버 지역 검색 결과를 담고 있는 구조체입니다.
struct LocationItem: Codable {
    
    /// 장소명
    let title: String
    
    /// 분류 정보
    let category: String
    
    /// 지번 주소
    let address: String
    
    /// 도로명 주소
    let roadAddress: String
    
    /// X좌표(KATECH = TM128 좌표계 기준)
    let mapx: String
    
    /// Y좌표(KATECH = TM128 좌표계 기준)
    let mapy: String
}

