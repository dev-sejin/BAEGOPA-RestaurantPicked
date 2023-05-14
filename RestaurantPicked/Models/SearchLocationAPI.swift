//
//  SearchLocationAPI.swift
//  RestaurantPicked
//
//  Created by 김민준 on 2023/05/14.
//

import Foundation
import Alamofire

/// 네이버 지역 검색 API 관리 클래스입니다.
final class SearchLocationAPI {
    
    /// 싱글톤
    static let shared = SearchLocationAPI()
    private init() {}
    
    /// 검색 결과 정렬 방법 케이스
    private enum Sort: String {
        
        /// 정확도순으로 내림차순 정렬
        case random
        
        /// 업체 및 기관에 대한 카페, 블로그의 리뷰 개수순으로 내림차순 정렬
        case comment
    }
    
    
    
    // MARK: - Properties
    
    /// Header 필드: Client ID
    private let headerID = "X-Naver-Client-Id"
    
    /// Header 필드: Client Secret
    private let headerPW = "X-Naver-Client-Secret"
    
    /// JSON 타입 반환 요청 기본 URL
    private let baseURL = "https://openapi.naver.com/v1/search/local.json"
    
    /// 기본 파라미터 적용 URL
    private var paramURL: String {
        
        /// 한번에 표시할 검색 결과 개수(기본값: 1, 최댓값: 5)
        let display = "5"
        
        /// 검색 시작 위치(기본값: 1, 최댓값: 1)
        let start = "1"
        
        /// 검색 결과 정렬 방법
        let sort = Sort.comment.rawValue
        
        /// URL 문자열 반환
        return "\(baseURL)?display=\(display)&start=\(start)&sort=\(sort)&query="
    }

    var result: SearchLocation?
    
    
    // MARK: - Method
    
    /// 네이버 지역 검색 결과를 요청합니다.
    ///
    /// - Parameter searchQuery: 검색어 입력
    func requestLocation(searchQuery: String) {
        
        /// 검색어 쿼리를 이용한 최종 URL 생성
        let completeURL = paramURL + searchQuery.safeURL
        
        /// HTTPHeaders
        let header: HTTPHeaders = [
            headerID : Bundle.main.LOCATION_ID,
            headerPW : Bundle.main.LOCATION_PW
        ]
        
        /// Request 요청 객체 생성
        let request = AF.request(completeURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header)
        
        /// Request 실행
        request
            .validate(statusCode: 200..<500)
            .responseDecodable(of: SearchLocation.self) { response in
                
                /// 네트워킹 상태 코드
                guard let statusCode = response.response?.statusCode else { return }
                
                switch response.result {
                    
                    /// 네트워킹 성공
                case .success(let searchLocation):
                    print("Status: \(statusCode) - SearchLocationAPI 네트워킹에 성공했습니다.")
                    self.result = searchLocation
                    
                    /// 네트워킹 실패
                case .failure(let error):
                    print("Status: \(statusCode) - SearchLocationAPI 네트워킹에 실패했습니다.")
                    print(error.localizedDescription)
                }
            }
    }
}
