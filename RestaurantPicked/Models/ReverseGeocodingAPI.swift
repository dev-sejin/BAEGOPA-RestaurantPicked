//
//  ReverseGeocodingAPI.swift
//  RestaurantPicked
//
//  Created by Hamin Jeong on 2023/05/15.
//

import Foundation
import Alamofire

class ReverseGeocodingAPI {
    
    //싱글톤
    static let shared = ReverseGeocodingAPI()
    private init() {}
    
    //기본 URL
    private let basicURL = "https://naveropenapi.apigw.ntruss.com/map-reversegeocode/v2/gc"
    
    //네트워크 타입
    typealias ReverseGeocodingNetwork = (GeoWelcome) -> Void
    
    //Alamofire를 통한 데이터 통신
    func getDataFromAPI(coord: String, completion: @escaping ReverseGeocodingNetwork) {
        //전체 URL
        let url = "\(basicURL)?coords=\(coord)&output=json"
        
        //HTTPHeader 설정
        let headers: HTTPHeaders = ["X-NCP-APIGW-API-KEY-ID" : Bundle.main.GEOCODING_ID, "X-NCP-APIGW-API-KEY" : Bundle.main.GEOCODING_PW]
        
        //request 설정 (GET)
        let request = AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers)
        
        //request를 통한 데이터 획득
        request
            .validate(statusCode: 200..<500)
            .responseDecodable(of: GeoWelcome.self) { response in
                switch response.result {
                case .success(let data):
                    completion(data)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
}
