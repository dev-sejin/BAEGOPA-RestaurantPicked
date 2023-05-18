//
//  ViewController.swift
//  RestaurantPicked
//
//  Created by Sejin on 2023/05/12.
//

import UIKit
import CoreLocation

final class RandomViewController: UIViewController {
    
    // MARK: - Properties
    
    // view 생성
    private let randomView = RandomView()
    // view 교체
    override func loadView() {
        view = randomView
    }
    
    // CLLocationManager
    private let locationManager = CLLocationManager()
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()  // 민감한 위치정보를 얻기 위해서는 사용자의 허락 요청 메서드
        configuerButtonAction()
        configureNaiBar()
    }
    
    
    // MARK: - Helpers Functions
    
    // button을 작동하기 위해서 addTarget 설정 ⭐️⭐️⭐️
    // 버튼의 실행을 위한 addTarget 메서드는 ViewController에만 존재 하기 때문에 UIView에서 직접 설정이 불가능 하다.
    private func configuerButtonAction() {
        randomView.randomButton.addTarget(self, action: #selector(randomButtonTapped), for: .touchUpInside)
    }
    
    
    // UI 관련 설정들
    private func configureNaiBar() {
        title = "Category Random"
        // settingBarButtonItem 생성 및 설정
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.2.badge.gearshape"), style: .plain, target: self, action: #selector(settingButtonTapped))
    }
    
    
    // MARK: - Selectors
    
    @objc func settingButtonTapped() {
        // 디테일뷰컨 생성
        let controller = SettingViewController()
        // 네비게이션컨트롤러를 이용한 화면이동
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
    @objc func randomButtonTapped() {
//        print("DEBUG: randombutton")
        let controller = RestaurantDetailViewController()
        // 네비게이션컨트롤러를 이용한 또다른 화면이동 코드방식
        show(controller, sender: nil)
    }
    
    
    // MARK: - Actions
    
    
    
}


// MARK: - Extension


