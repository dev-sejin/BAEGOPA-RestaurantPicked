//
//  SheetView.swift
//  RestaurantPicked
//
//  Created by Doyoung An on 2023/05/16.
//

import UIKit
import WebKit

final class SheetView: UIView {
    
    // MARK: - UI
    
    // web view 생성
    let webView: WKWebView = {
        let wv = WKWebView()
        wv.translatesAutoresizingMaskIntoConstraints = false
        return wv
    }()
    
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Helpers Functions
    
    private func configureUI() {
        self.backgroundColor = .white
        self.addSubview(webView)
        
        // AutoLayout
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            webView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            webView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
}
