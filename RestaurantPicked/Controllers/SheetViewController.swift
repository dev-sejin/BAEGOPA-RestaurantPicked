//
//  SheetViewController.swift
//  RestaurantPicked
//
//  Created by Doyoung An on 2023/05/16.
//

import UIKit
import WebKit

class SheetViewController: UIViewController {
    
    // MARK: - Properties
    
    // custom view 생성 (Views 폴더 -> SheetView: UIView 파일)
    private let sheetView = SheetView()
    // view 교체
    override func loadView() {
        view = sheetView
    }
    
    // web view url test
    private var webViewURL = SearchLocationAPI.shared.getRandomLocationWebViewURLString()
    
    
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        loadView()
    }
    
    
    // MARK: - Helpers Functions
    
    // web view load 메서드 (
    private func loadWebView() {
        
        guard let url = webViewURL else {
            print("error: webViewURL optional binding failed")
            return
        }
        
        guard let urlStruct = URL(string: url) else {
            print("error: fialed urlStruct")
            return
        }
        
        let urlRequest = URLRequest(url: urlStruct)
        sheetView.webView.load(urlRequest)
        
    }
    
    
    
    
    
}
