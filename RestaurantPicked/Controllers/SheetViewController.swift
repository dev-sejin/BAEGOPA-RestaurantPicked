//
//  SheetViewController.swift
//  RestaurantPicked
//
//  Created by Doyoung An on 2023/05/16.
//

import UIKit
import WebKit

final class SheetViewController: UIViewController {
    
    // MARK: - Properties
    
    // UI 관련된 변수들
    // view 생성
    private let sheetView = SheetView()
    // view 교체
    override func loadView() {
        view = sheetView
    }
    
    // 데이터 전달 관련 변수들
    // webViewURL 전달 받을 변수
    var webViewURL: String = "" {
        didSet {
            print(webViewURL)
        }
    }
    
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebView(webViewURL)
    }
    
    
    // MARK: - Helpers Functions
    
    // 웹뷰 로드 설정
    private func loadWebView(_ url: String) {
        
        guard let encodedString = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            print("DEBUGE: encodedString")
            return
        }
        
        guard let urlStruct = URL(string: encodedString) else {
            print("DEBUGE: fialed urlStruct")
            return
        }
        
        let urlRequest = URLRequest(url: urlStruct)
        sheetView.webView.load(urlRequest)
    }
    
}
