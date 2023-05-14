//
//  SafeURL.swift
//  RestaurantPicked
//
//  Created by 김민준 on 2023/05/14.
//

import Foundation

extension String {
    
    /// 한글 문자열 URL 포맷으로 변환 후 반환합니다.
    var safeURL: String {
        
        guard let url = self
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)?
            .replacingOccurrences(of: " ", with: "%20") else {
            fatalError("잘못된 URL 변환")
        }
        
        return url
    }
}
