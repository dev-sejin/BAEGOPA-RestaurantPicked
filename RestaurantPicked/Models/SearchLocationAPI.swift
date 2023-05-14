//
//  SearchLocationAPI.swift
//  RestaurantPicked
//
//  Created by 김민준 on 2023/05/14.
//

import Foundation

/// 네이버 지역 검색 API 관리 클래스입니다.
final class SearchLocationAPI {
    
    /// 싱글톤
    static let shared = SearchLocationAPI()
    private init() {}
    
    /// 검색 결과 정렬 방법 케이스
    enum Sort: String {
        
        /// 정확도순으로 내림차순 정렬
        case random
        
        /// 업체 및 기관에 대한 카페, 블로그의 리뷰 개수순으로 내림차순 정렬
        case comment
    }
    
    
    
    // MARK: - Properties
    
    // ✏️ 테스트용 좌표
    private let testCoordinate = "%EA%B2%BD%EA%B8%B0%EB%8F%84%20%EC%95%88%EC%82%B0%EC%8B%9C%20%EB%8B%A8%EC%9B%90%EA%B5%AC%20%EC%84%A0%EB%B6%803%EB%8F%99%20%EB%A7%9B%EC%A7%91"
    
    /// JSON 타입 반환 요청 기본 URL
    private let baseURL = "https://openapi.naver.com/v1/search/local.json"
    
    /// 기본 파라미터 적용 URL
    private var completeURL: String {
        
        /// 한번에 표시할 검색 결과 개수(기본값: 1, 최댓값: 5)
        let display = "5"

        /// 검색 시작 위치(기본값: 1, 최댓값: 1)
        let start = "1"
        
        /// 검색 결과 정렬 방법
        let sort = Sort.comment.rawValue
        
        /// URL 문자열 반환
        return "\(baseURL)?display=\(display)&start=\(start)&sort=\(sort)&query=\(testCoordinate)"
    }
    
    
    
    // MARK: - Method
    
    func requestLocation() {
        print(completeURL)
    }
    
}
