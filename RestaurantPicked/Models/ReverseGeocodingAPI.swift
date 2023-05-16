//
//  ReverseGeocodingAPI.swift
//  RestaurantPicked
//
//  Created by Hamin Jeong on 2023/05/15.
//

import Foundation
import Alamofire

class ReverseGeocodingAPI {
    
    static let shared = ReverseGeocodingAPI()
    private init() {}
    
    private let basicURL = "https://naveropenapi.apigw.ntruss.com/map-reversegeocode/v2/gc"
    
    typealias ReverseGeocodingNetwork = (GeoWelcome) -> Void
    
    func fetchData(coord: String, completion: @escaping ReverseGeocodingNetwork) {
        let url = "\(basicURL)?coords=\(coord)&output=json"
        
        getDataFromAPI(url: url) { result in
            completion(result)
        }
    }
    
    private func getDataFromAPI(url: String, completion: @escaping ReverseGeocodingNetwork) {
        let headers: HTTPHeaders = ["X-NCP-APIGW-API-KEY-ID" : Bundle.main.GEOCODING_ID, "X-NCP-APIGW-API-KEY" : Bundle.main.GEOCODING_PW]
        let request = AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers)
        
        request
            .validate(statusCode: 200..<500)
            .responseDecodable(of: GeoWelcome.self) { response in
                switch response.result {
                case .success(let data):
                    print(data)
                    completion(data)
                case .failure(let error):
                    print(error)
                }
            }
    }
    
}
