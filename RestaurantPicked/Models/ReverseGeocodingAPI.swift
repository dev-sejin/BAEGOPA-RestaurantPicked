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
//    idHeader = "X-NCP-APIGW-API-KEY-ID"
//    pwHeader = "X-NCP-APIGW-API-KEY"
    
    func fetchData(coord: String) {
        let url = "\(basicURL)?coords=\(coord)&output=json"
    }
    
}
